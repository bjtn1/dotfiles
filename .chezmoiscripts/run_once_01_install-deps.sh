#!/bin/bash
# Installs pywal16 and skhd. Runs once per machine.
[[ "$(uname -s)" == "Darwin" ]] || exit 0

# pywal16
if ! command -v wal &>/dev/null; then
    echo ">>> Installing pywal16..."
    pip3 install pywal16
else
    echo ">>> pywal16 already installed, skipping."
fi

# skhd
if ! command -v skhd &>/dev/null; then
    echo ">>> Installing skhd..."
    brew tap koekeishiya/formulae
    brew install skhd
else
    echo ">>> skhd already installed, skipping."
fi

skhd --start-service 2>/dev/null || true

echo ""
echo "⚠️  Action required: grant skhd Accessibility permission in"
echo "   System Settings > Privacy & Security > Accessibility"
echo "   Then run: skhd --restart-service"
