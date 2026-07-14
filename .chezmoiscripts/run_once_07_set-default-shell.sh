#!/bin/bash
# Sets fish as the default login shell on Arch-based Linux. Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

FISH_PATH="$(command -v fish)"
if [[ -z "$FISH_PATH" ]]; then
    echo ">>> fish not installed, skipping default shell change."
    exit 0
fi

if [[ "$(getent passwd "$USER" | cut -d: -f7)" == "$FISH_PATH" ]]; then
    echo ">>> fish is already the default shell for $USER."
    exit 0
fi

if ! grep -qxF "$FISH_PATH" /etc/shells; then
    echo ">>> Registering $FISH_PATH in /etc/shells..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells > /dev/null
fi

echo ">>> Setting fish as the default shell for $USER..."
sudo chsh -s "$FISH_PATH" "$USER"

echo ">>> Done. Log out and back in for the shell change to take effect."
