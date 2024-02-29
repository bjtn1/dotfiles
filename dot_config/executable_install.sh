#!/bin/bash

# This shell script is meant to run on a brand new computer running macOS

# Make sure this only runs on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then 
  echo "This script should only be run on MacOS. Aborting."
  exit 1;
fi

# Install xcode command line tools if not already installed
if ! command -v xcode-select > /dev/null && xcode-select --print-path; then
  xcode-select --install
fi

# Install homebrew if not already installed
if ! command -v brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Download chezmoi
  brew install chezmoi

  # Add my dotfiles to my local machine
  chezmoi init https://github.com/bjtn1/dotfiles.git

  # Check to see if `brewfile` file exists. If it does, download all of the brewfile packages
  brewfile=~/.config/brewfile

  if test -f "$brewfile"; then
    # Download packages from the brewfile in my dotfiles
    brew bundle install --file ~/.config/brewfile
  else
    echo "$HOME/.config/brewfile not found. Aborting"
    exit 1;
  fi
fi


