<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [What this is](#what-this-is)
- [Quickstart](#quickstart)
   * [New Mac](#new-mac)
   * [New Debian-family box](#new-debian-family-box)
   * [New CachyOS Linux box](#new-cachyos-linux-box)
- [How OS-conditional apply works](#how-os-conditional-apply-works)
- [What `chezmoi apply` actually runs (`run_once_*` scripts)](#what-chezmoi-apply-actually-runs-run_once_-scripts)
- [The wallpaper → color theming pipeline](#the-wallpaper--color-theming-pipeline)
   * [Linux (CachyOS / Hyprland / noctalia)](#linux-cachyos--hyprland--noctalia)
   * [macOS](#macos)
- [The `wallpaper` nvim colorscheme](#the-wallpaper-nvim-colorscheme)
- [Pokemon fastfetch (`ff`)](#pokemon-fastfetch-ff)
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

One [chezmoi](https://www.chezmoi.io/) repo, several machines:

- **A Mac** — Homebrew, skhd, launchd agents.
- **Debian-family boxes** (a Raspberry Pi, and now a Debian x86_64 home server) — plain apt CLI tools, no desktop environment.
- **A CachyOS Linux box** (Hyprland + [noctalia-shell](https://github.com/noctalia-dev/noctalia-shell)) — currently dormant/not in active use, might get picked back up later. Its profile stays intact either way.

All share the same source repo; `.chezmoiignore` and the OS/distro guards inside `.chezmoiscripts/` decide what actually lands on each machine, based on a `distroID` computed from `/etc/os-release` (see below) — not just CPU architecture, since two very different Linux setups (CachyOS desktop vs. a headless Debian server) can share the same `amd64` arch. If you're reading this because you forgot how any of it works — that's exactly what this file is for. Read top to bottom, it's written in the order things actually happen.

> **Reviving the CachyOS box**: since `.chezmoi.toml.tmpl` (which computes `distroID`) only runs at `chezmoi init` time, not on a plain `apply`/`update`, that machine's already-generated config predates the `distroID` addition. Re-run `chezmoi init` there (not just `apply`) before trusting `.chezmoiignore` again.

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

<!-- TOC --><a name="new-debian-family-box"></a>
## New Debian-family box

Covers a Raspberry Pi (Raspberry Pi OS) or a plain Debian box (e.g. the x86_64 home server) alike — both resolve to `distroID = "debian"`.

1. Install chezmoi (not in Debian's own apt repos as of trixie — use the official install script):
   ```
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```
   This installs the binary to `~/.local/bin` — make sure that's on `$PATH` before the next step.
2. Initialize and apply:
   ```
   chezmoi init --apply bjtn1
   ```

This installs every package in `debian_apt_packages.txt` via `apt-get`, applies the generic cross-platform configs (nvim, fish, kitty, tmux, scripts), and skips everything Mac-only or CachyOS-only. No desktop-environment setup happens here at all — this profile is CLI-only, whether the box is a Pi or a headless x86_64 server. Needs `sudo` once, for the apt install step.

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

`.chezmoiignore` hides whole paths depending on `.chezmoi.os` and a custom `distroID` value, so `chezmoi apply` only ever touches files relevant to the machine it's running on. `distroID` is computed once, in `.chezmoi.toml.tmpl`, at `chezmoi init` time — it shells out to read `/etc/os-release`'s `ID` (and `ID_LIKE`, so Debian-derivatives like Ubuntu would also count as `"debian"`, matching the `/etc/debian_version` check `run_onchange_after_04` uses), and stays empty on macOS. This exists specifically because CPU architecture alone can't tell two different x86_64 Linux setups apart — a CachyOS desktop and a headless Debian server are both `linux`/`amd64`, but need opposite treatment:

| Path | macOS | CachyOS (`distroID=cachyos`) | Debian-family (`distroID=debian`, Pi or x86_64) |
|---|---|---|---|
| `Library/` (LaunchAgents), `.skhdrc`, `.config/Brewfile` | ✅ | ❌ | ❌ |
| `.xinitrc`, `.config/hypr/`, `.config/nwg-look/` | ❌ | ✅ | ❌ |
| `.config/debian_apt_packages.txt` | ❌ | ❌ | ✅ |
| Everything else (nvim, fish, kitty, tmux, scripts, …) | ✅ | ✅ | ✅ |

Every script in `.chezmoiscripts/` also has its own guard at the top (`[[ "$(uname -s)" == "Darwin" ]] || exit 0`, `[[ -f /etc/debian_version ]] || exit 0`, etc.), so even if something isn't hidden by `.chezmoiignore`, the wrong-machine scripts still no-op instead of running.

---

<!-- TOC --><a name="what-chezmoi-apply-actually-runs-run_once_-scripts"></a>
# What `chezmoi apply` actually runs (`run_once_*` scripts)

These run in numeric order, once per machine (chezmoi hashes each script and re-runs it only if its content changes). Each one guards itself for the right OS/distro and no-ops otherwise, so this whole list runs unattended on `chezmoi init --apply` regardless of which machine you're on.

**Every script here is `_after_`** (`run_once_after_` or `run_onchange_after_`), not plain `run_once_` — `.chezmoiscripts` sorts before `dot_config` in chezmoi's apply order, so on a genuinely fresh machine a plain `run_once_` script would try to read a `dot_config`-tracked file (a package list, a script under `scripts/`, a `Library/LaunchAgents` plist, etc.) *before chezmoi has actually written it to disk yet*. Found this the hard way, on a real first `chezmoi init --apply` on a fresh Debian box — `xargs: Cannot open input file 'debian_apt_packages.txt': No such file or directory`. `_after_` guarantees the whole regular file/dotfile apply finishes first; within that phase, scripts still run in their numeric order relative to each other.

Four of them (`04`, `05`, `10`, `12`) are `run_onchange_` rather than `run_once_` — keyed off a checksum of the file/directory they depend on (embedded as a template comment), so they re-run automatically whenever that content actually changes, not just once ever.

| Script | What it does |
|---|---|
| `run_once_after_01_install-deps.sh` | **macOS.** Installs everything in `Brewfile`, including `pywal16` and `skhd`. |
| `run_once_after_02_setup-macos.sh` | **macOS.** Caps Lock → Escape, Right Cmd → Right Ctrl, `Cmd+Shift+S` for screenshots. |
| `run_once_after_03_load-agents.sh` | **macOS.** Loads the two launchd agents that shuffle wallpaper and watch for wallpaper changes. |
| `run_onchange_after_04_install-debian-deps.sh.tmpl` | **Debian-family only** (Pi or x86_64). Installs `apt` packages from `debian_apt_packages.txt`. |
| `run_onchange_after_05_install-arch-deps.sh.tmpl` | **CachyOS.** Bootstraps `yay` from the AUR if it's missing (`base-devel` + `git` + `yay-bin` + `makepkg -si`), then installs every package in `cachyos_yay_packages.txt`. |
| `run_once_after_06_setup-greetd.sh` | **CachyOS.** Writes `/etc/greetd/config.toml` pointing at `noctalia-greeter-session`, enables `greetd.service`, disables `sddm.service` if present, and patches PAM via noctalia-greeter's own setup script. This is what gets you an actual login screen. Runs after `05` in the same `_after_` phase, since it needs the `greetd` package that installs. |
| `run_once_after_07_set-default-shell.sh` | **Any Linux with `fish` installed** (Arch-family or Debian-family). Registers `fish` in `/etc/shells` and `chsh`s you into it. Runs after `04`/`05`, since it needs `fish` itself already installed. |
| `run_once_after_08_generate-wal-colors.sh` | **CachyOS.** Runs `apply-pywal-colorscheme` once against `~/.config/hypr/current_wallpaper` so the pywal caches exist before anything tries to read them (Hyprland's `$color*` vars, kdeglobals, etc.). Runs after `05`, since it needs `wal` itself already installed. |
| `run_once_after_09_setup-firefox-config.sh` | **Linux.** If Firefox has no profile yet, launches it headless just long enough to create one, applies the tracked `user.js`, then (if there's an actual display) opens each extension's addons.mozilla.org page so you can one-click install them. |
| `run_onchange_after_10_prewarm-wallpapers.sh.tmpl` | **Linux.** Runs `prewarm-noctalia-wallpapers`, which sets each wallpaper in `~/.config/wallpapers/` in turn to warm noctalia's per-wallpaper cache. Keyed off a checksum of the wallpaper directory listing, so it re-runs automatically whenever the wallpaper set actually changes (e.g. the external repo pulls in new files), not just once ever — and specifically runs after that same apply's `.chezmoiexternal.toml` sync. **Heads up:** since it calls `wallpaper set` on every file with a short sleep between each, this visibly flickers through your entire wallpaper collection and lands on whichever sorts last — not whatever was showing before. |
| `run_once_after_11_download-pokemon.sh` | **Cross-platform.** Bulk-downloads every Pokemon's fastfetch artwork (normal + shiny, all 1025) via `download-all-pokemon`, so `ff` (see below) is instant from the first use instead of hitting PokeAPI per new Pokemon. |
| `run_onchange_after_12_install-linuxbrew-cli.sh.tmpl` | **Non-CachyOS Arch-family Linux** (e.g. Steam Deck). Installs Homebrew (Linux) and the CLI tools in `linux_brew_packages.txt`. Keyed off that file's checksum, same re-run-on-change behavior as `04`/`05`/`10`. |

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

Wallpapers themselves live in `~/.config/wallpapers/`, pulled from a separate repo ([github.com/bjtn1/wallpapers](https://github.com/bjtn1/wallpapers)) via `.chezmoiexternal.toml.tmpl` — it's ~750MB, too big to want inside the dotfiles repo proper, and refreshes every 7 days on `chezmoi apply`. Skipped entirely (`{{ if ne .distroID "debian" }}`) on Debian-family boxes — no GUI there to show a wallpaper on, not worth the bandwidth/disk.

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

<!-- TOC --><a name="the-wallpaper-nvim-colorscheme"></a>
# The `wallpaper` nvim colorscheme

`~/.config/nvim/colors/wallpaper.lua` is a real Neovim colorscheme generated live from the same `~/.cache/wal/colors.json` the pipeline above already maintains — same palette as kitty, on both machines. It's the default (`init.lua` calls `vim.cmd.colorscheme("wallpaper")` on startup); switch away any time with `:colorscheme <name>`.

- Maps pywal's 16-slot palette onto base16-style semantics (color1=red/error, color2=green/string, color3=yellow/warning, color4=blue/function, color5=magenta/keyword, color6=cyan/type), then sets every classic highlight group plus the treesitter `@`-capture groups (linked onto the classic ones, not hand-tuned individually) and LSP diagnostic groups.
- **Repaints automatically when the wallpaper changes** — no polling. It watches `~/.cache/wal/` for filesystem events (inotify on Linux, FSEvents on macOS) via `vim.uv.new_fs_event()`, debounced 100ms to let a write settle before re-reading, then reruns the whole colorscheme. Stops watching cleanly the moment you switch to a different colorscheme, so it won't fight you.
- If the cache file is missing or unparseable, it `vim.notify`s an error and leaves your current highlights alone rather than crashing.
- Needs `-b 000000` in whatever `wal` invocation writes `colors.json` for the background to come out pure black — both `apply-pywal-colorscheme` (Linux) and `wal-wallpaper-watch.sh` (macOS) pass it, so this looks identical on both machines.

---

<!-- TOC --><a name="pokemon-fastfetch-ff"></a>
# Pokemon fastfetch (`ff`)

Run `ff` instead of `fastfetch` and you get a random Pokemon (official artwork, small chance of shiny) as the logo instead of a distro icon.

- `ff` (fish function in `config.fish`) runs `fetch-pokemon` then `fastfetch`.
- `~/.config/scripts/fetch-pokemon` — with no argument, picks a random Pokemon (id 1–1025); with an argument, fetches a specific one by number or name (`ff 25`, `ff pikachu`). 1-in-10 chance of shiny by default (`SHINY_CHANCE`, real games use 1-in-4096). Checks a persistent local cache first (`~/.cache/fastfetch/sprites/`, keyed by id) so repeat calls hit PokeAPI only on a genuine miss; on any failure (offline, bad name, API down) it leaves the previous image in place instead of erroring.
- `~/.config/scripts/download-all-pokemon` — bulk-fetches all 1025 into that same persistent cache (10 in parallel), normal + shiny sprites for each. Safe to re-run any time, skips whatever's already cached. This is what `run_once_11` runs automatically on a new machine, so `ff` is instant from day one instead of filling in gradually.

---

<!-- TOC --><a name="manual-maintenance-commands"></a>
# Manual maintenance commands

These aren't wired to any keybind — you run them by hand. Two of them (marked below) now also fire automatically from `.chezmoiscripts/`, but re-running by hand any time is still fine — both are idempotent.

| Command | What it does |
|---|---|
| `bac` (`~/.config/scripts/bac`) | Cross-platform: backs up installed packages (`yay -Qqe` on Linux, `brew bundle dump` on Mac) and re-syncs every already-tracked config directory into the chezmoi source, then `chezmoi re-add`s anything else. This is what actually commits+pushes your day-to-day config edits — chezmoi's `autopush` only fires on chezmoi's own commands (`add`, `forget`, `re-add`, `apply`), not on you editing a file directly, so nothing gets committed until you run `bac`. |
| `dots` (fish function) | The macOS-only, Homebrew-flavored version of the same idea: `brew update && brew upgrade`, dumps the `Brewfile`, then `chezmoi re-add`. |
| `~/.config/scripts/prewarm-noctalia-wallpapers` | Calls `qs ipc … wallpaper set` on every file in `~/.config/wallpapers/` once, so noctalia's per-wallpaper cache (resize + Material You color extraction) is already warm and picking a wallpaper never eats the one-time processing cost live. *Also runs automatically — see `run_onchange_after_10` above.* |
| `~/.config/scripts/download-all-pokemon` | Bulk-fetches all 1025 Pokemon sprites into the `ff` cache. *Also runs automatically once — see `run_once_11` above.* |
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

Applied by `~/.config/scripts/setup-key-remapping.sh` (run automatically by `run_once_after_02`), which writes `~/Library/LaunchAgents/com.local.KeyRemapping.plist` and loads it via `launchctl`. Runs automatically at every login after that.

<!-- TOC --><a name="screenshot-shortcut"></a>
## Screenshot shortcut

Selected-area screenshot remapped to **Cmd+Shift+S** (macOS default is Cmd+Shift+4), via `~/.config/scripts/setup-screenshot-shortcut.sh` (also run by `run_once_after_02`). It edits `~/Library/Preferences/com.apple.symbolichotkeys.plist` directly and takes effect immediately, no logout needed. The full plist isn't tracked by chezmoi — too volatile — only this one script touches only the relevant entry.

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
- **Firefox extensions** are one click away, not fully automatic — `run_once_after_09` opens each tracked extension's AMO page in a browser tab (if there's a display to show it on), but you still have to click "Add to Firefox" yourself. Bookmarks, saved logins, and history are never tracked at all (see `.config/mozilla` above).
- **`yay` bootstrap in `run_onchange_after_05`** assumes `base-devel` + `git` + a working AUR are reachable — fine on a normal CachyOS install, but the very first `sudo pacman -S` in there is a real network + package operation, not a no-op guard like most of these scripts.
