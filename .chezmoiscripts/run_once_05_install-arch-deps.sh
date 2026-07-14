#!/bin/bash
# Installs pacman and yay packages on Arch-based Linux (Arch, EndeavourOS). Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

distro_id="$(. /etc/os-release && echo "$ID")"

case "$distro_id" in
    endeavouros)
        pacman_file="$HOME/.config/endeavouros_pacman_packages.txt"
        yay_file="$HOME/.config/endeavouros_yay_packages.txt"
        ;;
    arch)
        pacman_file="$HOME/.config/arch_pacman_packages.txt"
        yay_file="$HOME/.config/arch_yay_packages.txt"
        ;;
    *)
        echo ">>> Unrecognized Arch-based distro ($distro_id), skipping package install."
        exit 0
        ;;
esac

echo ">>> Installing pacman packages for $distro_id..."
xargs -a "$pacman_file" sudo pacman -S --needed --noconfirm

if ! command -v yay &>/dev/null; then
    echo ">>> yay still not available after pacman install, skipping AUR packages."
    exit 0
fi

echo ">>> Installing yay/AUR packages for $distro_id..."
xargs -a "$yay_file" yay -S --needed --noconfirm
