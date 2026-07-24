#!/bin/bash
# Watches Plasma's own wallpaper config for changes and re-runs wal so kitty's
# colors track the current wallpaper, without depending on waypaper/Hyprland.

PLASMA_CONF="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
LAST=""

current_wallpaper() {
  grep -oP 'Image=file://\K[^\s]+' "$PLASMA_CONF" 2>/dev/null | head -1
}

apply_theme() {
  local wallpaper="$1"
  local kitty_sock
  kitty_sock=$(ls /tmp/kitty.sock-* 2>/dev/null | head -1)

  # Save opacity state before wal runs (toggle kitten writes state files)
  local is_transparent=false
  if ls /tmp/kitty_opacity_* 2>/dev/null | grep -q .; then
    is_transparent=true
  fi

  wal -i "$wallpaper" -q -s --backend haishoku
  cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/current-theme.conf
  # Force background and terminal black (color0) to stay pure black
  sed -i 's/^background[[:space:]].*/background         #000000/' ~/.config/kitty/current-theme.conf
  sed -i 's/^color0[[:space:]].*/color0       #000000/' ~/.config/kitty/current-theme.conf

  if [ -n "$kitty_sock" ]; then
    kitty @ --to unix:"$kitty_sock" set-colors --all --configured ~/.config/kitty/current-theme.conf 2>/dev/null
    if [ "$is_transparent" = true ]; then
      kitty @ --to unix:"$kitty_sock" set-background-opacity 0.0 2>/dev/null
    fi
  else
    kill -SIGUSR1 "$(pgrep -x kitty)" 2>/dev/null
  fi
}

# Apply once on startup in case the wallpaper changed while this wasn't running
LAST=$(current_wallpaper)
[ -n "$LAST" ] && apply_theme "$LAST"

while inotifywait -qq -e modify "$PLASMA_CONF" 2>/dev/null; do
  CURRENT=$(current_wallpaper)
  if [ -n "$CURRENT" ] && [ "$CURRENT" != "$LAST" ]; then
    apply_theme "$CURRENT"
    LAST="$CURRENT"
  fi
done
