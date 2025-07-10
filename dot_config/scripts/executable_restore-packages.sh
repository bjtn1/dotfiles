#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="$HOME/.config"

case "$(uname)" in
  Darwin)
    echo "Restoring Homebrew packages..."
    brew bundle --file="$CONFIG_DIR/brewfile.txt"
    ;;
  Linux)
    if [ -f /etc/os-release ]; then
      source /etc/os-release
      DISTRO="${ID,,}"
    else
      DISTRO="linux"
    fi

    if [ -f "$CONFIG_DIR/${DISTRO}_pacman_packages.txt" ]; then
      echo "Restoring Pacman packages..."
      sudo pacman -S --needed - < "$CONFIG_DIR/${DISTRO}_pacman_packages.txt"
    fi

    if [ -f "$CONFIG_DIR/${DISTRO}_yay_packages.txt" ]; then
      echo "Restoring Yay packages..."
      yay -S --needed - < "$CONFIG_DIR/${DISTRO}_yay_packages.txt"
    fi
    ;;
  *)
    echo "❌ Unsupported OS"
    exit 1
    ;;
esac
