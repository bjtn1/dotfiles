#!/bin/bash
# Loads launchd agents for wallpaper shuffling and wal-watch. Runs once per machine.
[[ "$(uname -s)" == "Darwin" ]] || exit 0

echo ">>> Loading launchd agents..."

launchctl bootstrap gui/$(id -u) \
    "$HOME/Library/LaunchAgents/com.user.wallpaper-shuffle.plist" 2>/dev/null || true

launchctl bootstrap gui/$(id -u) \
    "$HOME/Library/LaunchAgents/com.user.wal-watch.plist" 2>/dev/null || true

echo ">>> Agents loaded."
