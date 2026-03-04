function dots --description "Sync chezmoi dotfiles: update/upgrade brew, dump Brewfile, re-add all tracked files, and push"
    echo "Updating Homebrew..."
    brew update

    echo "Upgrading packages..."
    brew upgrade

    echo "Dumping Brewfile..."
    brew bundle dump --file ~/.config/Brewfile --force

    echo "Syncing dotfiles..."
    if chezmoi re-add
        echo "Done."
    else
        echo "Something went wrong — check the output above."
        return 1
    end
end
