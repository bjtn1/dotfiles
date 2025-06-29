Install [chezmoi](https://www.chezmoi.io/install/) before doing anything

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Downloading dotfiles manager (chezmoi)](#downloading-dotfiles-manager-chezmoi)
   * [For macOS](#for-macos)
   * [For Arch](#for-arch)
- [Installing my dotfiles](#installing-my-dotfiles)
- [Installing packages](#installing-packages)
- [Miscellaneous stuff](#miscellaneous-stuff)
   * [Changing right-command key to ctrl key on mac](#changing-right-command-key-to-ctrl-key-on-mac)

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

<!-- TOC --><a name="miscellaneous-stuff"></a>
# Miscellaneous stuff

<!-- TOC --><a name="changing-right-command-key-to-ctrl-key-on-mac"></a>
## Changing right-command key to ctrl key on mac
> [Source](https://hidutil-generator.netlify.app/)
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.KeyRemapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>{"UserKeyMapping":[
            {
              "HIDKeyboardModifierMappingSrc": 0x7000000E7,
              "HIDKeyboardModifierMappingDst": 0x7000000E4
            }
        ]}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```
