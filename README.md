Install [chezmoi](https://www.chezmoi.io/install/) before doing anything

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Downloading dotfiles manager (chezmoi)](#downloading-dotfiles-manager-chezmoi)
   * [For macOS](#for-macos)
   * [For Arch](#for-arch)
- [Installing my dotfiles](#installing-my-dotfiles)
- [Installing packages](#installing-packages)
- [macOS setup](#macos-setup)
   * [Key remapping (hidutil)](#key-remapping-hidutil)
   * [Wallpaper + pywal16](#wallpaper--pywal16)
   * [launchd agents](#launchd-agents)
   * [skhd](#skhd)

<!-- TOC end -->

<!-- TOC --><a name="downloading-dotfiles-manager-chezmoi"></a>
# Downloading dotfiles manager ([chezmoi](https://www.chezmoi.io/))

<!-- TOC --><a name="for-macos"></a>
## For macOS

1) You need a package manager. I use [Homebrew](https://brew.sh/)

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2) Install chezmoi

`brew install chezmoi`

<!-- TOC --><a name="for-arch"></a>
## For Arch

1) Install chezmoi

`yay -S chezmoi`

or

`pacman -S chezmoi`

<!-- TOC --><a name="installing-my-dotfiles"></a>
# Installing my dotfiles

`chezmoi init --apply bjtn1`

> ⚠️ This will download all my dotfiles to `$HOME/.local/share/chezmoi/` AND to their respective locations in `$HOME/.config/` [Click here for more info](https://www.chezmoi.io/quick-start/#set-up-a-new-machine-with-a-single-command)

<!-- TOC --><a name="installing-packages"></a>
# Installing packages

In `$HOME/.config/` there is a file called `backup-and-install-packages.md` where it'll tell you what command to run to backup or install packages to and from a file

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

<!-- TOC --><a name="wallpaper--pywal16"></a>
## Wallpaper + pywal16

Wallpapers live in `~/.config/wallpapers/`.

Three scripts in `~/.config/scripts/` handle wallpaper rotation and color theming:

| Script | Purpose |
|---|---|
| `wallpaper-shuffle.sh` | Picks a random wallpaper every 60s via `osascript` |
| `wal-wallpaper-watch.sh` | Watches for wallpaper changes, runs `pywal16`, updates kitty colors, forces `background` and `color0` to `#000000` |
| `wallpaper-next.sh` | One-shot wallpaper change (called by skhd hotkey) |

`pywal16` must be installed. The `wal` binary is expected at `~/.local/bin/wal` (installed by pywal16 into the user's local bin via pip).

<!-- TOC --><a name="launchd-agents"></a>
## launchd agents

Four agents live in `~/Library/LaunchAgents/`. They are **not** managed by chezmoi and must be set up manually on a new machine.

| Plist | What it does |
|---|---|
| `com.local.KeyRemapping.plist` | Loads hidutil key remapping at login |
| `com.user.wallpaper-shuffle.plist` | Runs `wallpaper-shuffle.sh` continuously in the background |
| `com.user.wal-watch.plist` | Runs `wal-wallpaper-watch.sh` continuously in the background |
| `com.koekeishiya.skhd.plist` | Installed by skhd via Homebrew |

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
