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
    /opt/homebrew/bin/kitty @ --to unix:/tmp/kitty.sock set-colors --all --configured ~/.config/kitty/current-theme.conf 2>/dev/null || kill -SIGUSR1 $(pgrep -x kitty) 2>/dev/null
    LAST="$CURRENT"
  fi
  sleep 5
done
