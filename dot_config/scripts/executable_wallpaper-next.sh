#!/bin/bash
WALLPAPER_DIR="$HOME/.config/wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | /opt/homebrew/bin/shuf -n 1)
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""
