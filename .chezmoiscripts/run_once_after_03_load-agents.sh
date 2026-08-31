#!/bin/bash
# Loads launchd agents for wallpaper shuffling and wal-watch. Runs once per machine.
# _after_: loads plist files chezmoi itself writes to ~/Library/LaunchAgents,
# which wouldn't exist yet on a fresh machine in a plain run_once_ script.
[[ "$(uname -s)" == "Darwin" ]] || exit 0

echo ">>> Loading launchd agents..."

launchctl bootstrap gui/$(id -u) \
    "$HOME/Library/LaunchAgents/com.user.wallpaper-shuffle.plist" 2>/dev/null || true

launchctl bootstrap gui/$(id -u) \
    "$HOME/Library/LaunchAgents/com.user.wal-watch.plist" 2>/dev/null || true

echo ">>> Agents loaded."
