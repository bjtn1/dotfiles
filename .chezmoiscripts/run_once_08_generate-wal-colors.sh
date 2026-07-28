#!/bin/bash
# Seeds ~/.cache/wal/colors-hyprland.conf (so windows.conf/hyprlock.conf $colorN
# vars resolve) and kdeglobals (so dolphin matches) on first launch. Runs once
# per machine.
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

APPLY_SCRIPT="$HOME/.config/scripts/apply-pywal-colorscheme"
if command -v plasma-apply-colorscheme &>/dev/null && [[ -x "$APPLY_SCRIPT" ]]; then
    echo ">>> Generating wal colors and applying to kdeglobals..."
    "$APPLY_SCRIPT" "$WALLPAPER"
else
    echo ">>> Generating wal colors from current_wallpaper..."
    wal -q -n -i "$WALLPAPER"
fi
