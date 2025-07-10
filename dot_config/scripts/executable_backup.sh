#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="$HOME/.config"
CHEZMOI_DIR="$HOME/.local/share/chezmoi"
DRY_RUN=false

backup_packages() {
  echo "📦 Backing up packages..."
  
  case "$(uname)" in
    Darwin)
      if $DRY_RUN; then
        echo "DRY RUN: Would backup Homebrew packages to $CONFIG_DIR/brewfile.txt"
        return
      fi
      echo "Backing up Homebrew packages..."
      brew bundle dump -f --file="$CONFIG_DIR/brewfile.txt"
      echo "✅ Homebrew packages saved to $CONFIG_DIR/brewfile.txt"
      ;;
    Linux)
      if [ -f /etc/os-release ]; then
        source /etc/os-release
        DISTRO="${ID,,}"  # lowercase distro name
      else
        DISTRO="linux"
      fi

      if command -v pacman >/dev/null; then
        if $DRY_RUN; then
          echo "DRY RUN: Would backup pacman packages to $CONFIG_DIR/${DISTRO}_pacman_packages.txt"
        else
          pacman -Qqe > "$CONFIG_DIR/${DISTRO}_pacman_packages.txt"
          echo "✅ Pacman packages saved to $CONFIG_DIR/${DISTRO}_pacman_packages.txt"
        fi
      fi

      if command -v yay >/dev/null; then
        if $DRY_RUN; then
          echo "DRY RUN: Would backup yay packages to $CONFIG_DIR/${DISTRO}_yay_packages.txt"
        else
          yay -Qqe > "$CONFIG_DIR/${DISTRO}_yay_packages.txt"
          echo "✅ Yay packages saved to $CONFIG_DIR/${DISTRO}_yay_packages.txt"
        fi
      fi
      ;;
    *)
      echo "❌ Unsupported OS"
      exit 1
      ;;
  esac
}

get_top_level_dirs() {
  # Get all managed directories and filter to only keep top-level ones
  chezmoi managed -i dirs | while read -r dir; do
    # Remove any subdirectories (anything containing / after the first component)
    if [[ "$dir" != */* ]]; then
      echo "$dir"
    else
      # For paths with slashes, only keep the first component
      echo "${dir%%/*}"
    fi
  done | sort -u  # Remove duplicates
}

backup_configs() {
  if ! command -v chezmoi >/dev/null; then
    echo "❌ chezmoi is not installed"
    exit 1
  fi

  echo "⚙️ Backing up config files with chezmoi..."
  if $DRY_RUN; then
    echo "DRY RUN: Would perform these actions:"
  else
    echo "⚠️ Warning: This will remove and re-add top-level managed directories to chezmoi"
  fi

  # Get top-level directories managed by chezmoi
  mapfile -t managed_dirs < <(get_top_level_dirs)

  if [ ${#managed_dirs[@]} -eq 0 ]; then
    echo "ℹ️ No directories currently managed by chezmoi"
    return
  fi

  for dir in "${managed_dirs[@]}"; do
    local source_dir="$HOME/$dir"
    local target_dir="$CHEZMOI_DIR/dot_${dir//\//_}"

    # Handle special chezmoi paths (like .config becomes dot_config)
    if [[ $dir == .* ]]; then
      target_dir="$CHEZMOI_DIR/dot_${dir#.}"
    fi

    if [ -d "$source_dir" ]; then
      if $DRY_RUN; then
        echo "DRY RUN: Would process top-level directory $dir"
        echo "DRY RUN: Would remove $target_dir"
        echo "DRY RUN: Would add all files under $source_dir"
      else
        echo "🔧 Processing $dir..."
        
        # Remove existing chezmoi management
        # rm -rf "$target_dir"
        
        # Add all files recursively
        find "$source_dir" -type f | while read -r file; do
          chezmoi add "$file"
        done
        
        echo "✅ Added $dir and all subdirectories to chezmoi"
      fi
    else
      echo "⚠️ Directory $source_dir not found, skipping"
    fi
  done
}

show_help() {
  cat <<EOF
Usage: $0 [OPTION]

Backup system packages and configuration files.

Options:
  -p, --packages    Backup installed packages only
  -c, --configs     Backup configuration files only
  -a, --all         Backup both packages and configs (default)
  -n, --dry-run     Show what would be backed up without making changes
  -h, --help        Show this help message

Examples:
  $0 -p             Backup only packages
  $0 --configs      Backup only config files
  $0 -a --dry-run   Show what would be backed up (no changes)
  $0 -n             Dry run of everything (default action)
  $0                Backup everything (default action)
EOF
}

main() {
  # Parse options
  while [ $# -gt 0 ]; do
    case "$1" in
      -p|--packages)
        local do_packages=true
        shift
        ;;
      -c|--configs)
        local do_configs=true
        shift
        ;;
      -a|--all)
        local do_packages=true
        local do_configs=true
        shift
        ;;
      -n|--dry-run)
        DRY_RUN=true
        shift
        ;;
      -h|--help)
        show_help
        exit 0
        ;;
      *)
        echo "❌ Invalid option: $1"
        show_help
        exit 1
        ;;
    esac
  done

  # Default to all if no specific options provided
  if [[ -z ${do_packages:-} && -z ${do_configs:-} ]]; then
    local do_packages=true
    local do_configs=true
  fi

  # Execute requested actions
  if [[ ${do_packages:-} == true ]]; then
    backup_packages
  fi

  if [[ ${do_configs:-} == true ]]; then
    backup_configs
  fi
}

main "$@"
