<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [New Mac quickstart](#new-mac-quickstart)
- [New Linux quickstart](#new-linux-quickstart)
- [OS-conditional apply](#os-conditional-apply)
- [Installing packages](#installing-packages)
- [macOS setup](#macos-setup)
   * [Key remapping (hidutil)](#key-remapping-hidutil)
   * [Screenshot shortcut](#screenshot-shortcut)
   * [Wallpaper + pywal16](#wallpaper--pywal16)
   * [launchd agents](#launchd-agents)
   * [skhd](#skhd)
   * [Kitty opacity shortcuts](#kitty-opacity-shortcuts)

<!-- TOC end -->

<!-- TOC --><a name="new-mac-quickstart"></a>
# New Mac quickstart

**1. Install Homebrew**
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**2. Install chezmoi and apply dotfiles**
```
brew install chezmoi
chezmoi init --apply bjtn1
```

This automatically runs setup scripts (in `.chezmoiscripts/`) that:
- Install pywal16 and skhd
- Apply key remapping and screenshot shortcut
- Load the wallpaper and wal-watch launchd agents

**3. Grant skhd Accessibility permission** *(manual — requires GUI)*

Go to **System Settings > Privacy & Security > Accessibility**, enable skhd, then:
```
skhd --restart-service
```

That's it.

---

<!-- TOC --><a name="new-linux-quickstart"></a>
# New Linux quickstart

**1. Install chezmoi**
```
yay -S chezmoi
```
or
```
pacman -S chezmoi
```

**2. Apply dotfiles**
```
chezmoi init --apply bjtn1
```

macOS-specific setup scripts are skipped automatically on Linux.

---

<!-- TOC --><a name="os-conditional-apply"></a>
# OS-conditional apply

`.chezmoiignore` ensures `chezmoi apply` only touches files relevant to the current OS.

| File / directory | macOS | Linux (EndeavourOS) |
|---|---|---|
| `Library/` (LaunchAgents) | ✅ | ❌ |
| `.skhdrc` | ✅ | ❌ |
| `.config/brewfile.txt` | ✅ | ❌ |
| `.config/{hypr,dunst,waybar,waypaper,rofi,swaync,wlogout,grub-themes,nwg-look}/` | ❌ | ✅ |
| `.xinitrc` | ❌ | ✅ |
| `.config/{arch,endeavouros}_*_packages.txt` | ❌ | ✅ |
| Everything else (nvim, fish, kitty, scripts, tmux, …) | ✅ | ✅ |

The `.chezmoiscripts/` setup scripts also guard against running on the wrong OS via `[[ "$(uname -s)" == "Darwin" ]] || exit 0`.

---

<!-- TOC --><a name="installing-packages"></a>
# Installing packages

In `$HOME/.config/` there is a file called `backup-and-install-packages.md` where it'll tell you what command to run to backup or install packages to and from a file

## dots

The `dots` fish function (defined in `~/.config/fish/functions/dots.fish`) syncs your dotfiles in one command:

```
dots
```

It runs:
1. `brew update` — fetch latest Homebrew index
2. `brew upgrade` — upgrade all installed packages
3. `brew bundle dump` — snapshot installed packages to `~/.config/Brewfile`
4. `chezmoi re-add` — re-add all chezmoi-tracked files and push

<!-- TOC --><a name="macos-setup"></a>
# macOS setup

<!-- TOC --><a name="key-remapping-hidutil"></a>
## Key remapping (hidutil)

> [hidutil key code reference](https://hidutil-generator.netlify.app/)

Remappings:
- **Caps Lock → Escape**
- **Right Command → Right Control**

Run the setup script to write and load the plist:

```
~/.config/scripts/setup-key-remapping.sh
```

This writes `~/Library/LaunchAgents/com.local.KeyRemapping.plist` and loads it via `launchctl`. It runs automatically at login via launchd.

<!-- TOC --><a name="screenshot-shortcut"></a>
## Screenshot shortcut

Selected area screenshot is remapped to **Cmd+Shift+S** (macOS default is Cmd+Shift+4).

Run the setup script to apply it:

```
~/.config/scripts/setup-screenshot-shortcut.sh
```

This modifies `~/Library/Preferences/com.apple.symbolichotkeys.plist` directly and activates the change immediately — no logout required. The full plist is not tracked by chezmoi (it's too volatile); this script applies only the one relevant entry.

<!-- TOC --><a name="wallpaper--pywal16"></a>
## Wallpaper + pywal16

Wallpapers live in `~/.config/wallpapers/`, pulled automatically from [github.com/bjtn1/wallpapers](https://github.com/bjtn1/wallpapers) via `.chezmoiexternal.toml` (refreshes every 7 days on `chezmoi apply`). The wallpapers repo is managed separately due to its size (~750MB).

Three scripts in `~/.config/scripts/` handle wallpaper rotation and color theming:

| Script | Purpose |
|---|---|
| `wallpaper-shuffle.sh` | Picks a random wallpaper every 60s via `osascript` |
| `wal-wallpaper-watch.sh` | Watches for wallpaper changes, runs `pywal16`, updates kitty colors, forces `background` and `color0` to `#000000` |
| `wallpaper-next.sh` | One-shot wallpaper change (called by skhd hotkey) |

`pywal16` must be installed. The `wal` binary is expected at `~/.local/bin/wal` (installed by pywal16 into the user's local bin via pip).

<!-- TOC --><a name="launchd-agents"></a>
## launchd agents

Four agents live in `~/Library/LaunchAgents/`.

| Plist | What it does | Managed by chezmoi |
|---|---|---|
| `com.local.KeyRemapping.plist` | Loads hidutil key remapping at login | No — generated by `setup-key-remapping.sh` |
| `com.user.wallpaper-shuffle.plist` | Runs `wallpaper-shuffle.sh` continuously in the background | Yes (templated) |
| `com.user.wal-watch.plist` | Runs `wal-wallpaper-watch.sh` continuously in the background | Yes (templated) |
| `com.koekeishiya.skhd.plist` | Installed by skhd via Homebrew | No — managed by skhd |

The two chezmoi-managed plists use `{{ .chezmoi.homeDir }}` to avoid hardcoding the username, so they work correctly on any machine.

To load an agent:
```
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/<plist-name>.plist
```

To unload an agent:
```
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/<plist-name>.plist
```

To check status:
```
launchctl list | grep <label>
```

> ⚠️ `com.user.wallpaper-shuffle.plist` and `com.user.wal-watch.plist` both reference scripts at `~/.config/scripts/`. Make sure chezmoi has applied the dotfiles before loading these agents.

<!-- TOC --><a name="skhd"></a>
## skhd

Install via the custom tap (not in default Homebrew):

```
brew tap koekeishiya/formulae
brew install skhd
skhd --start-service
```

skhd requires **Accessibility permission** in System Settings > Privacy & Security before it will function.

Hotkeys defined in `~/.skhdrc`:

| Hotkey | Action |
|---|---|
| `ctrl + shift + w` | Change wallpaper (runs `wallpaper-next.sh`) |

<!-- TOC --><a name="kitty-opacity-shortcuts"></a>
## Kitty opacity shortcuts

Kitty supports runtime background opacity via three shortcuts:

| Shortcut | Action |
|---|---|
| `ctrl+shift+equal` | Increase opacity (less transparent) |
| `ctrl+shift+minus` | Decrease opacity (more transparent) |
| `ctrl+shift+0` | Toggle between fully opaque and fully transparent |

The toggle is implemented as a Python kitten at `~/.config/kitty/toggle_opacity.py`. It tracks state per-window via a temp file in `/tmp/` and uses `boss.call_remote_control()` internally — no socket or `allow_remote_control` required.

Requires `dynamic_background_opacity yes` in `kitty.conf`.
