#!/bin/bash
# Applies key remapping and screenshot shortcut. Runs once per machine.
# _after_: calls scripts under dot_config/scripts, which wouldn't exist
# yet on a fresh machine in a plain run_once_ script.
[[ "$(uname -s)" == "Darwin" ]] || exit 0

echo ">>> Setting up key remapping..."
"$HOME/.config/scripts/setup-key-remapping.sh"

echo ">>> Setting up screenshot shortcut..."
"$HOME/.config/scripts/setup-screenshot-shortcut.sh"
