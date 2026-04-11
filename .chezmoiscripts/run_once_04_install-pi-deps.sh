#!/bin/bash
# Installs apt packages on Raspberry Pi. Runs once per machine.
[[ "$(uname -m)" == "aarch64" && -f /etc/debian_version ]] || exit 0

echo ">>> Installing apt packages for Raspberry Pi..."
sudo apt-get update
xargs -a "$HOME/.config/pi_apt_packages.txt" sudo apt-get install -y

echo ">>> Pi dependencies installed."
