#!/bin/bash
WALLPAPER_DIR="$HOME/.config/wallpapers"
INTERVAL=60  # seconds

while true; do
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""
  sleep $INTERVAL
done
