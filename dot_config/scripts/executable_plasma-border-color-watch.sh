#!/bin/bash
# Watches Plasma's own wallpaper config and re-themes KDE's window border
# colors (kdeglobals [WM] section) from the current wallpaper via pywal.
# Active border = vivid accent (color11), inactive = muted tone (color8) —
# same convention the old Hyprland active_border/inactive_border config used.

PLASMA_CONF="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
LAST=""

current_wallpaper() {
  grep -oP 'Image=file://\K[^\s]+' "$PLASMA_CONF" 2>/dev/null | head -1
}

hex_to_rgb() {
  local hex="${1#\#}"
  printf "%d,%d,%d" "0x${hex:0:2}" "0x${hex:2:2}" "0x${hex:4:2}"
}

apply_border_colors() {
  local wallpaper="$1"

  wal -i "$wallpaper" -q -s -n --backend haishoku
  # shellcheck disable=SC1090
  source ~/.cache/wal/colors.sh

  local active_rgb inactive_rgb
  active_rgb=$(hex_to_rgb "$color11")
  inactive_rgb=$(hex_to_rgb "$color8")

  kwriteconfig6 --file kdeglobals --group WM --key activeBackground "$active_rgb"
  kwriteconfig6 --file kdeglobals --group WM --key inactiveBackground "$inactive_rgb"

  qdbus6 org.kde.KWin /KWin reconfigure 2>/dev/null
}

# Apply once on startup in case the wallpaper changed while this wasn't running
LAST=$(current_wallpaper)
[ -n "$LAST" ] && apply_border_colors "$LAST"

while inotifywait -qq -e modify "$PLASMA_CONF" 2>/dev/null; do
  CURRENT=$(current_wallpaper)
  if [ -n "$CURRENT" ] && [ "$CURRENT" != "$LAST" ]; then
    apply_border_colors "$CURRENT"
    LAST="$CURRENT"
  fi
done
