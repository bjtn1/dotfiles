#!/bin/bash
# Installs apt packages on any Debian-family box (Raspberry Pi OS, plain
# Debian, etc.). Runs once per machine.
[[ -f /etc/debian_version ]] || exit 0

echo ">>> Installing apt packages..."
sudo apt-get update
xargs -a "$HOME/.config/debian_apt_packages.txt" sudo apt-get install -y

echo ">>> Debian apt dependencies installed."
