function dots --description "Sync chezmoi dotfiles: re-add all tracked files and push"
    echo "Syncing dotfiles..."
    if chezmoi re-add
        echo "Done."
    else
        echo "Something went wrong — check the output above."
        return 1
    end
end
