#!/bin/bash
# Installs yay/AUR packages on CachyOS. Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

distro_id="$(. /etc/os-release && echo "$ID")"

if [[ "$distro_id" != "cachyos" ]]; then
    echo ">>> Unrecognized distro ($distro_id), skipping package install."
    exit 0
fi

yay_file="$HOME/.config/cachyos_yay_packages.txt"

if [[ ! -f "$yay_file" ]]; then
    echo ">>> $yay_file not found, skipping package install."
    exit 0
fi

if ! command -v yay &>/dev/null; then
    echo ">>> yay not available, skipping package install."
    exit 0
fi

echo ">>> Installing yay/AUR packages for $distro_id..."
xargs -a "$yay_file" yay -S --needed --noconfirm
