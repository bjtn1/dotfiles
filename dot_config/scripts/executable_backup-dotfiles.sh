#!/usr/bin/env bash

set -euo pipefail

DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "🔍 Dry run: showing what would be backed up..."
else
  echo "📦 Backing up all files managed by chezmoi..."
fi

chezmoi managed | while IFS= read -r file; do
  if [ -e "$file" ]; then
    if $DRY_RUN; then
      echo "🔍 Would re-add: $file"
    else
      echo "📂 Re-adding: $file"
      chezmoi add "$file"
    fi
  else
    echo "🚫 Skipping missing: $file"
  fi
done

$DRY_RUN && echo "✅ Dry run complete." || echo "✅ Backup complete."
