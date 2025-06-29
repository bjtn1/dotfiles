<!-- TOC --><a name="-backing-up-restoring-installed-packages-pacman-yay-homebrew"></a>
# 📦 Backing Up & Restoring Installed Packages (Pacman, Yay & Homebrew)

This guide helps you back up and restore packages explicitly installed via [`pacman`](https://wiki.archlinux.org/title/Pacman), [`yay`](https://github.com/Jguer/yay), and [`Homebrew`](https://brew.sh/).

> 📚 Sources:  
> - [Arch Wiki – Pacman Tips & Tricks](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages)  
> - [Homebrew Bundle Docs](https://github.com/Homebrew/homebrew-bundle)

---

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->
   * [📝 Backup Installed Packages](#-backup-installed-packages)
      + [🔹 Pacman (Arch Linux)](#-pacman-arch-linux)
      + [🔹 Yay (AUR helper)](#-yay-aur-helper)
         - [Or backup both at once:](#or-backup-both-at-once)
      + [🔹 Homebrew (macOS)](#-homebrew-macos)
   * [📥 Restore Packages from Backup](#-restore-packages-from-backup)
      + [🔹 Pacman](#-pacman)
      + [🔹 Yay](#-yay)
      + [🔹 Homebrew](#-homebrew)

<!-- TOC end -->

<!-- TOC --><a name="-backup-installed-packages"></a>
## 📝 Backup Installed Packages

<!-- TOC --><a name="-pacman-arch-linux"></a>
### 🔹 Pacman (Arch Linux)

```bash
pacman -Qqe > ~/.config/pacman-packages.txt
```

> 💡 This saves a list of **explicitly installed** packages (not dependencies).  
> 🧠 You can change the file path to anything you prefer.

<!-- TOC --><a name="-yay-aur-helper"></a>
### 🔹 Yay (AUR helper)

```bash
yay -Qqe > ~/.config/yay-packages.txt
```

> 💡 Same idea as above, but for AUR packages.

<!-- TOC --><a name="or-backup-both-at-once"></a>
#### Or backup both at once:
```bash
pacman -Qqe > ~/.config/pacman-packages.txt && yay -Qqe > ~/.config/yay-packages.txt
```

<!-- TOC --><a name="-homebrew-macos"></a>
### 🔹 Homebrew (macOS)

```bash
brew bundle dump -f --file=~/.config/brewfile.txt
```

> 💡 This will write all your installed Homebrew packages (including casks, taps, and App Store apps) to `~/.config/brewfile.txt`.  
> 🧠 You can rename the file or path as needed.

---

<!-- TOC --><a name="-restore-packages-from-backup"></a>
## 📥 Restore Packages from Backup

<!-- TOC --><a name="-pacman"></a>
### 🔹 Pacman

```bash
pacman -S --needed - < ~/.config/pacman-packages.txt
```

<!-- TOC --><a name="-yay"></a>
### 🔹 Yay

```bash
yay -S --needed - < ~/.config/yay-packages.txt
```

> ✅ `--needed` skips reinstalling packages that are already present.  
> 📥 `-` reads from the file.

<!-- TOC --><a name="-homebrew"></a>
### 🔹 Homebrew

```bash
brew bundle --file=~/.config/brewfile.txt
```

> 📦 This will reinstall everything listed in the file — formulas, casks, taps, and Mac App Store apps.  
> 🧠 Adjust the file path if you saved it somewhere else.
