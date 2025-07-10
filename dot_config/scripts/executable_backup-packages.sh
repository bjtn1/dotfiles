#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="$HOME/.config"

case "$(uname)" in
  Darwin)
    echo "Backing up Homebrew packages..."
    brew bundle dump -f --file="$CONFIG_DIR/brewfile.txt"
    echo "✅ Homebrew packages saved to $CONFIG_DIR/brewfile.txt"
    ;;
  Linux)
    if [ -f /etc/os-release ]; then
      source /etc/os-release
      DISTRO="${ID,,}"  # lowercase distro name
    else
      DISTRO="linux"
    fi

    if command -v pacman >/dev/null; then
      pacman -Qqe > "$CONFIG_DIR/${DISTRO}_pacman_packages.txt"
      echo "✅ Pacman packages saved to $CONFIG_DIR/${DISTRO}_pacman_packages.txt"
    fi

    if command -v yay >/dev/null; then
      yay -Qqe > "$CONFIG_DIR/${DISTRO}_yay_packages.txt"
      echo "✅ Yay packages saved to $CONFIG_DIR/${DISTRO}_yay_packages.txt"
    fi
    ;;
  *)
    echo "❌ Unsupported OS"
    exit 1
    ;;
esac
