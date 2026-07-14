#!/bin/bash
# Seeds ~/.cache/wal/colors-hyprland.conf so windows.conf/hyprlock.conf $colorN vars resolve on first Hyprland launch. Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

if ! command -v wal &>/dev/null; then
    echo ">>> wal not installed, skipping color generation."
    exit 0
fi

WALLPAPER="$HOME/.config/hypr/current_wallpaper"
if [[ ! -f "$WALLPAPER" ]]; then
    echo ">>> $WALLPAPER not found, skipping color generation."
    exit 0
fi

echo ">>> Generating wal colors from current_wallpaper..."
wal -q -n -i "$WALLPAPER"
