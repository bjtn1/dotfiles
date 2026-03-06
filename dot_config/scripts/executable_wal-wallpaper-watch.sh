#!/bin/bash
LAST=""
while true; do
  CURRENT=$(osascript -e 'tell app "finder" to get posix path of (desktop picture as alias)' 2>/dev/null)
  if [ "$CURRENT" != "$LAST" ] && [ -n "$CURRENT" ]; then
    /Users/bjtn/.local/bin/wal -i "$CURRENT" -q --backend haishoku
    cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/current-theme.conf
    # Force background and terminal black (color0) to stay pure black
    sed -i '' 's/^background[[:space:]].*/background         #000000/' ~/.config/kitty/current-theme.conf
    sed -i '' 's/^color0[[:space:]].*/color0       #000000/' ~/.config/kitty/current-theme.conf
    KITTY_SOCK=$(ls /tmp/kitty.sock-* 2>/dev/null | head -1)
    if [ -n "$KITTY_SOCK" ]; then
      /opt/homebrew/bin/kitty @ --to unix:"$KITTY_SOCK" set-colors --all --configured ~/.config/kitty/current-theme.conf 2>/dev/null
    else
      kill -SIGUSR1 $(pgrep -x kitty) 2>/dev/null
    fi
    LAST="$CURRENT"
  fi
  sleep 5
done
