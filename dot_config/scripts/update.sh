#!/usr/bin/env bash

set -euo pipefail

# Check if chezmoi is installed
if ! command -v chezmoi &> /dev/null; then
    echo "Error: chezmoi is not installed"
    exit 1
fi

# Navigate to chezmoi source directory
cd ~/.local/share/chezmoi || { echo "Error: Cannot access ~/.local/share/chezmoi"; exit 1; }

# Get list of managed files
managed_files=$(chezmoi managed)

if [ -z "$managed_files" ]; then
    echo "No managed files found"
    exit 0
fi

# Remove managed files from chezmoi source directory
echo "Removing managed files from ~/.local/share/chezmoi..."
while IFS= read -r file; do
    # Skip if file doesn't exist in source directory
    src_file="$HOME/.local/share/chezmoi/$file"
    if [ -e "$src_file" ]; then
        rm -f "$src_file" && echo "Removed $file"
    fi
done <<< "$managed_files"

# Re-add managed files
echo "Re-adding managed files..."
while IFS= read -r file; do
    chezmoi add "$HOME/$file" && echo "Re-added $file"
done <<< "$managed_files"

echo "Update complete"
