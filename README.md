<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [What this is](#what-this-is)
- [Quickstart](#quickstart)
   * [New Mac](#new-mac)
   * [New CachyOS Linux box](#new-cachyos-linux-box)
- [How OS-conditional apply works](#how-os-conditional-apply-works)
- [What `chezmoi apply` actually runs (`run_once_*` scripts)](#what-chezmoi-apply-actually-runs-run_once_-scripts)
- [The wallpaper → color theming pipeline](#the-wallpaper--color-theming-pipeline)
   * [Linux (CachyOS / Hyprland / noctalia)](#linux-cachyos--hyprland--noctalia)
   * [macOS](#macos)
- [Manual maintenance commands](#manual-maintenance-commands)
- [Files chezmoi deliberately does NOT track](#files-chezmoi-deliberately-does-not-track)
- [macOS-only details](#macos-only-details)
   * [Key remapping (hidutil)](#key-remapping-hidutil)
   * [Screenshot shortcut](#screenshot-shortcut)
   * [launchd agents](#launchd-agents)
   * [skhd](#skhd)
- [Kitty opacity shortcuts](#kitty-opacity-shortcuts)
- [Where keybinds live](#where-keybinds-live)
- [Known gaps](#known-gaps)

<!-- TOC end -->

<!-- TOC --><a name="what-this-is"></a>
# What this is

One [chezmoi](https://www.chezmoi.io/) repo, two machines:

- **A Mac** — Homebrew, skhd, launchd agents.
- **A CachyOS Linux box** (Hyprland + [noctalia-shell](https://github.com/noctalia-dev/noctalia-shell)) — the primary daily driver.

Both share the same source repo; `.chezmoiignore` and the OS guards inside `.chezmoiscripts/` decide what actually lands on each machine. If you're reading this because you forgot how any of it works — that's exactly what this file is for. Read top to bottom, it's written in the order things actually happen.

---

<!-- TOC --><a name="quickstart"></a>
# Quickstart

<!-- TOC --><a name="new-mac"></a>
## New Mac

1. Install Homebrew:
   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install chezmoi:
   ```
   brew install chezmoi
   ```
3. Initialize and apply:
   ```
   chezmoi init --apply bjtn1
   ```

That single command triggers the whole `run_once_*` chain below — Homebrew packages, key remapping, launchd agents, everything.

<!-- TOC --><a name="new-cachyos-linux-box"></a>
## New CachyOS Linux box

1. Install chezmoi (it's in the official Arch repos, no AUR helper needed yet):
   ```
   sudo pacman -S chezmoi
   ```
2. Initialize and apply:
   ```
   chezmoi init --apply bjtn1
   ```

This will bootstrap `yay` itself if it isn't already on the system, then install every package in `cachyos_yay_packages.txt`, set up greetd/noctalia-greeter as the login manager, generate the initial pywal color cache, and set up Firefox. See the script-by-script breakdown below — there's a lot packed into that one command, and it needs `sudo` a few times along the way (package install, greetd config, PAM patch, chsh).

---

<!-- TOC --><a name="how-os-conditional-apply-works"></a>
# How OS-conditional apply works

`.chezmoiignore` hides whole paths depending on `.chezmoi.os` / `.chezmoi.arch`, so `chezmoi apply` only ever touches files relevant to the machine it's running on:

| Path | macOS | Linux (CachyOS, x86_64) | Linux (Pi, arm64) |
|---|---|---|---|
| `Library/` (LaunchAgents), `.skhdrc`, `.config/brewfile.txt` | ✅ | ❌ | ❌ |
| `.xinitrc`, `.config/hypr/`, `.config/nwg-look/` | ❌ | ✅ | ❌ |
| `.config/pi_apt_packages.txt` | ❌ | ❌ | ✅ |
| Everything else (nvim, fish, kitty, tmux, scripts, …) | ✅ | ✅ | ✅ |

Every script in `.chezmoiscripts/` also has its own guard at the top (`[[ "$(uname -s)" == "Darwin" ]] || exit 0`, etc.), so even if something isn't hidden by `.chezmoiignore`, the wrong-OS scripts still no-op instead of running.

---

<!-- TOC --><a name="what-chezmoi-apply-actually-runs-run_once_-scripts"></a>
# What `chezmoi apply` actually runs (`run_once_*` scripts)

These run in numeric order, once per machine (chezmoi hashes each script and re-runs it only if its content changes). Each one guards itself for the right OS/distro and no-ops otherwise, so this whole list runs unattended on `chezmoi init --apply` regardless of which machine you're on.

| Script | What it does |
|---|---|
| `01_install-deps.sh` | **macOS.** Installs everything in `Brewfile`, including `pywal16` and `skhd`. |
| `02_setup-macos.sh` | **macOS.** Caps Lock → Escape, Right Cmd → Right Ctrl, `Cmd+Shift+S` for screenshots. |
| `03_load-agents.sh` | **macOS.** Loads the two launchd agents that shuffle wallpaper and watch for wallpaper changes. |
| `04_install-pi-deps.sh` | **Raspberry Pi only.** Installs `apt` packages. |
| `05_install-arch-deps.sh` | **CachyOS.** Bootstraps `yay` from the AUR if it's missing (`base-devel` + `git` + `yay-bin` + `makepkg -si`), then installs every package in `cachyos_yay_packages.txt`. |
| `06_setup-greetd.sh` | **CachyOS.** Writes `/etc/greetd/config.toml` pointing at `noctalia-greeter-session`, enables `greetd.service`, disables `sddm.service` if present, and patches PAM via noctalia-greeter's own setup script. This is what gets you an actual login screen. |
| `07_set-default-shell.sh` | **Arch-based Linux.** Registers `fish` in `/etc/shells` and `chsh`s you into it. |
| `08_generate-wal-colors.sh` | **CachyOS.** Runs `apply-pywal-colorscheme` once against `~/.config/hypr/current_wallpaper` so the pywal caches exist before anything tries to read them (Hyprland's `$color*` vars, kdeglobals, etc.). |
| `09_setup-firefox-config.sh` | **Linux.** If Firefox has no profile yet, launches it headless just long enough to create one, applies the tracked `user.js`, then (if there's an actual display) opens each extension's addons.mozilla.org page so you can one-click install them. |

---

<!-- TOC --><a name="the-wallpaper--color-theming-pipeline"></a>
# The wallpaper → color theming pipeline

This is the part that's least obvious from just reading file names, so it gets its own section.

<!-- TOC --><a name="linux-cachyos--hyprland--noctalia"></a>
## Linux (CachyOS / Hyprland / noctalia)

1. `SUPER+W` runs `~/.config/scripts/random-wallpaper`, which picks a random file from `~/.config/wallpapers/` and calls `qs ipc -c noctalia-shell call wallpaper set <file> ""`.
   > This exists as a workaround — noctalia's own `wallpaper random` IPC command is broken on this system (see the comment at the top of `random-wallpaper`).
2. noctalia applies the wallpaper, then fires its `wallpaperChange` hook (configured in `~/.config/noctalia/settings.json`), which runs `~/.config/scripts/apply-pywal-colorscheme <wallpaper-path>`.
3. That script:
   - Runs `wal -i <wallpaper> -b 000000 -s -q` — generates the main pywal cache in `~/.cache/wal/`, with the background forced to pure black. This is what Hyprland's `$colorN` vars, fuzzel, and the terminal all read from.
   - Copies `~/.cache/wal/colors-kitty.conf` → `~/.config/kitty/current-theme.conf` (force-patching `background` to `#000000` again, belt-and-suspenders), then pushes it live to every running kitty window via `kitty @ set-colors` over each instance's remote-control socket (`kitty.conf` sets `listen_on unix:/tmp/kitty`, which kitty expands per-instance to `/tmp/kitty-<pid>`). kitty does **not** reload its config on file change or on `SIGUSR1` — this socket push is the only way to update already-open windows live.
   - Runs a **second** `wal` invocation with `-n` (skip pushing to open terminals) into `~/.cache/wal-kde/`, producing a "natural" (non-black-forced) palette used only for KDE/dolphin theming.
     > Gotcha: `~/.cache/wal/sequences` is shared global state that `wal` always writes to regardless of `--out-dir`, and fish's `config.fish` `cat`s that file on every new shell startup to live-set the terminal's background color. The second `wal` call would silently clobber it with the non-black "natural" background, so the script snapshots the black-forced version before that call and restores it after — otherwise every *new* terminal window (not just the current one) would pick up the wrong background.
   - Ping-pongs between two KDE color-scheme names (`PywalA`/`PywalB`) and runs `plasma-apply-colorscheme`, because that command no-ops if you ask it to re-apply whatever's already active.
   - Runs `hyprctl reload`.

Wallpapers themselves live in `~/.config/wallpapers/`, pulled from a separate repo ([github.com/bjtn1/wallpapers](https://github.com/bjtn1/wallpapers)) via `.chezmoiexternal.toml` — it's ~750MB, too big to want inside the dotfiles repo proper, and refreshes every 7 days on `chezmoi apply`.

<!-- TOC --><a name="macos"></a>
## macOS

Parallel, older, simpler pipeline — no noctalia on macOS:

| Script | Purpose |
|---|---|
| `wallpaper-shuffle.sh` | Picks a random wallpaper every 60s via `osascript`. Run continuously by the `com.user.wallpaper-shuffle` launchd agent. |
| `wal-wallpaper-watch.sh` | Polls for wallpaper changes, runs `pywal16`, updates kitty's colors, forces `background`/`color0` to `#000000`. Run continuously by the `com.user.wal-watch` launchd agent. |
| `wallpaper-next.sh` | One-shot wallpaper change, bound to `ctrl+shift+w` via skhd. |

`pywal16`'s `wal` binary is expected at `~/.local/bin/wal` (that's where `pip` puts it).

---

<!-- TOC --><a name="manual-maintenance-commands"></a>
# Manual maintenance commands

These aren't wired to any keybind or hook — you run them by hand.

| Command | What it does |
|---|---|
| `bac` (`~/.config/scripts/bac`) | Cross-platform: backs up installed packages (`yay -Qqe` on Linux, `brew bundle dump` on Mac) and re-syncs every already-tracked config directory into the chezmoi source, then `chezmoi re-add`s anything else. This is what actually commits+pushes your day-to-day config edits — chezmoi's `autopush` only fires on chezmoi's own commands (`add`, `forget`, `re-add`, `apply`), not on you editing a file directly, so nothing gets committed until you run `bac`. |
| `dots` (fish function) | The macOS-only, Homebrew-flavored version of the same idea: `brew update && brew upgrade`, dumps the `Brewfile`, then `chezmoi re-add`. |
| `~/.config/scripts/prewarm-noctalia-wallpapers` | Calls `qs ipc … wallpaper set` on every file in `~/.config/wallpapers/` once, so noctalia's per-wallpaper cache (resize + Material You color extraction) is already warm and picking a wallpaper never eats the one-time processing cost live. Safe to re-run any time you add wallpapers. |
| `~/.config/scripts/restore-packages` | The read side of `bac`'s package backup — reinstalls from the saved package list. |
| `chezmoi status` / `cms` | Shows what would change if you ran `chezmoi apply` right now. |
| `chezmoi doctor` / `cmd` | Health check — verifies git state, checks for required external tools (`nvim`, `gpg`, etc.), flags config issues. |

---

<!-- TOC --><a name="files-chezmoi-deliberately-does-not-track"></a>
# Files chezmoi deliberately does NOT track

Listed in `.chezmoiignore`, these are generated fresh on every machine and would just be commit noise if tracked:

- `.config/hypr/current_wallpaper` — copy of whatever wallpaper is currently active.
- `.config/noctalia/colors.json` — noctalia's own extracted Material You palette.
- `.config/kdeglobals`, `.local/share/color-schemes/` — written by `plasma-apply-colorscheme`.
- `.config/kitty/current-theme.conf` — regenerated by `apply-pywal-colorscheme` on every wallpaper change (see the pipeline section above).
- `.config/fish/fish_variables` — fish's own runtime state.
- `.config/mozilla/` — the live Firefox profile (cookies, saved logins, history). Firefox *config* is tracked separately under `.config/firefox-custom/` and applied via `apply-firefox-config`; the live profile itself is a hard-block, never tracked directly.
- `**/.git` anywhere in the tree — nested repos cloned by plugin managers (tpm, yazi packs, etc.) are regenerable by their own tools.

---

<!-- TOC --><a name="macos-only-details"></a>
# macOS-only details

<!-- TOC --><a name="key-remapping-hidutil"></a>
## Key remapping (hidutil)

> [hidutil key code reference](https://hidutil-generator.netlify.app/)

- **Caps Lock → Escape**
- **Right Command → Right Control**

Applied by `~/.config/scripts/setup-key-remapping.sh` (run automatically by `run_once_02`), which writes `~/Library/LaunchAgents/com.local.KeyRemapping.plist` and loads it via `launchctl`. Runs automatically at every login after that.

<!-- TOC --><a name="screenshot-shortcut"></a>
## Screenshot shortcut

Selected-area screenshot remapped to **Cmd+Shift+S** (macOS default is Cmd+Shift+4), via `~/.config/scripts/setup-screenshot-shortcut.sh` (also run by `run_once_02`). It edits `~/Library/Preferences/com.apple.symbolichotkeys.plist` directly and takes effect immediately, no logout needed. The full plist isn't tracked by chezmoi — too volatile — only this one script touches only the relevant entry.

<!-- TOC --><a name="launchd-agents"></a>
## launchd agents

Four agents live in `~/Library/LaunchAgents/`:

| Plist | What it does | Tracked by chezmoi |
|---|---|---|
| `com.local.KeyRemapping.plist` | Loads hidutil key remapping at login | No — generated by `setup-key-remapping.sh` |
| `com.user.wallpaper-shuffle.plist` | Runs `wallpaper-shuffle.sh` continuously | Yes (templated, uses `{{ .chezmoi.homeDir }}`) |
| `com.user.wal-watch.plist` | Runs `wal-wallpaper-watch.sh` continuously | Yes (templated) |
| `com.koekeishiya.skhd.plist` | skhd's own service | No — managed by skhd itself |

Load an agent: `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/<name>.plist`
Unload: `launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/<name>.plist`
Check status: `launchctl list | grep <label>`

> Make sure chezmoi has already applied the dotfiles before loading `wallpaper-shuffle`/`wal-watch` — both reference scripts under `~/.config/scripts/`.

<!-- TOC --><a name="skhd"></a>
## skhd

Installed from a custom tap (not default Homebrew):
```
brew tap koekeishiya/formulae
brew install skhd
skhd --start-service
```
Needs **Accessibility permission** in System Settings → Privacy & Security before it'll do anything.

| Hotkey (`~/.skhdrc`) | Action |
|---|---|
| `ctrl + shift + w` | Change wallpaper (`wallpaper-next.sh`) |

---

<!-- TOC --><a name="kitty-opacity-shortcuts"></a>
# Kitty opacity shortcuts

Cross-platform, works the same on both machines:

| Shortcut | Action |
|---|---|
| `ctrl+shift+equal` | More opaque |
| `ctrl+shift+minus` | More transparent |
| `ctrl+shift+0` | Toggle fully opaque ↔ fully transparent |

The toggle is a Python kitten (`~/.config/kitty/toggle_opacity.py`) tracking state per-window via a temp file in `/tmp/`, using `boss.call_remote_control()` internally — doesn't need `allow_remote_control` or a socket. Requires `dynamic_background_opacity yes` in `kitty.conf` (already set). Default opacity is a flat `background_opacity 0.90` in `kitty.conf` — same value on every machine, no per-host template.

On Linux there's a second, independent layer of transparency: `~/.config/hypr/conf/windowrules.lua` also forces kitty windows to `opacity = "0.90 override"` at the Hyprland compositor level, stacking with kitty's own opacity.

---

<!-- TOC --><a name="where-keybinds-live"></a>
# Where keybinds live

Linux/Hyprland keybinds are all in `~/.config/hypr/conf/keybinds.lua`. Press `SUPER+/` any time to run `show-keybinds.sh` and see them listed on-screen instead of digging through that file.

---

<!-- TOC --><a name="known-gaps"></a>
# Known gaps

Things this repo does **not** cover, on purpose or otherwise — worth knowing before assuming a nuke-and-restore is 100% turnkey:

- **No secrets management.** No SSH keys, GPG keys, or password-manager integration (`chezmoi doctor` confirms: no `age`, no `pass`/`bitwarden`/etc. configured). A fresh machine needs those restored through some other channel before things like `git push` from the chezmoi repo will even authenticate.
- **Firefox extensions** are one click away, not fully automatic — `run_once_09` opens each tracked extension's AMO page in a browser tab (if there's a display to show it on), but you still have to click "Add to Firefox" yourself. Bookmarks, saved logins, and history are never tracked at all (see `.config/mozilla` above).
- **`yay` bootstrap in `run_once_05`** assumes `base-devel` + `git` + a working AUR are reachable — fine on a normal CachyOS install, but the very first `sudo pacman -S` in there is a real network + package operation, not a no-op guard like most of these scripts.
