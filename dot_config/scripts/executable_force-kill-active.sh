#!/usr/bin/env bash
# Force-kill the active window. Steam ignores SIGTERM to its window's pid
# (a launcher process respawns the client), so it needs its own
# `steam -shutdown` instead of a plain kill.

class=$(hyprctl activewindow -j | jq -r '.class')

if [[ "${class,,}" == *steam* ]]; then
  steam -shutdown
else
  pid=$(hyprctl activewindow -j | jq -r '.pid')
  kill "$pid"
fi
