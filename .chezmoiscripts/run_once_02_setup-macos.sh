#!/bin/bash
# Applies key remapping and screenshot shortcut. Runs once per machine.
[[ "$(uname -s)" == "Darwin" ]] || exit 0

echo ">>> Setting up key remapping..."
"$HOME/.config/scripts/setup-key-remapping.sh"

echo ">>> Setting up screenshot shortcut..."
"$HOME/.config/scripts/setup-screenshot-shortcut.sh"
