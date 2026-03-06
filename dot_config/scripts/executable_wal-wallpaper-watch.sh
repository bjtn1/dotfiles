#!/bin/bash
LAST=""
while true; do
  CURRENT=$(osascript -e 'tell app "finder" to get posix path of (desktop picture as alias)' 2>/dev/null)
  if [ "$CURRENT" != "$LAST" ] && [ -n "$CURRENT" ]; then
    KITTY_SOCK=$(ls /tmp/kitty.sock-* 2>/dev/null | head -1)

    # Save opacity state before wal runs (toggle kitten writes state files)
    IS_TRANSPARENT=false
    if ls /tmp/kitty_opacity_* 2>/dev/null | grep -q .; then
      IS_TRANSPARENT=true
    fi

    # -s skips wal's own terminal color application (including SIGUSR1 to kitty)
    # so we can handle the kitty update ourselves without opacity resets
    /Users/bjtn/.local/bin/wal -i "$CURRENT" -q -s --backend haishoku
    cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/current-theme.conf
    # Force background and terminal black (color0) to stay pure black
    sed -i '' 's/^background[[:space:]].*/background         #000000/' ~/.config/kitty/current-theme.conf
    sed -i '' 's/^color0[[:space:]].*/color0       #000000/' ~/.config/kitty/current-theme.conf

    if [ -n "$KITTY_SOCK" ]; then
      /opt/homebrew/bin/kitty @ --to unix:"$KITTY_SOCK" set-colors --all --configured ~/.config/kitty/current-theme.conf 2>/dev/null
      # Restore transparency if it was active before the wallpaper change
      if [ "$IS_TRANSPARENT" = true ]; then
        /opt/homebrew/bin/kitty @ --to unix:"$KITTY_SOCK" set-background-opacity 0.0 2>/dev/null
      fi
    else
      kill -SIGUSR1 $(pgrep -x kitty) 2>/dev/null
    fi
    LAST="$CURRENT"
  fi
  sleep 5
done
