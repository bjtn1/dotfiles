if status is-interactive
  # Commands to run in interactive sessions can go here
end

# this removes the greeting when fish shell is first launched
set -U fish_greeting
set -gx EDITOR nvim

alias config="cd ~/.config/"
alias fishconfig="nv ~/.config/fish/config.fish"
alias l="eza --oneline --long --all --header --git --git-repos --classify=always --icons=always --group-directories-first --no-quotes --hyperlink --group"
alias cl="clear"
alias nv="nvim"
alias kittyconf="nv ~/.config/kitty/kitty.conf"
alias ip='ipconfig getifaddr en0'
alias activate="source bin/activate"
alias login-items="sfltool dumpbtm"
alias lg="lazygit"
alias e="exit"
alias nv="nvim"
# alias lv="lvim"
alias cl="clear"
alias cat="bat"
alias z="zoxide"
alias unzipall='find . -name "*.zip" -exec unzip -v {} \;'
alias rmdsstore="defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true && defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && find . -type f -name '.DS_Store' -exec rm -rf {} \;"
alias bft="blowfish-tools"
alias bakobs="mv -v ~/Movies/obs/*.mp4 /Volumes/B/obs && rm -rfv ~/Movies/obs/*.mkv"
alias du-sh="ncdu"

# Tmux
alias tm="tmux"
alias tmn="tmux new"
alias tma="tmux attach"
alias tml="tmux ls"
alias tmd="tmux detach"
alias tmk="tmux kill-session"

# Python
alias py="python3"
alias pip="pip3"
alias venv="py -m venv"

# homebrew
alias bi="brew install"
alias bic="brew install --cask"
alias bu="brew uninstall"
alias buc="brew uninstall --cask"
alias bri="brew reinstall"
alias bric="brew reinstall --cask"

# Git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'
alias gitpwd='git rev-parse --abbrev-ref HEAD'

# Chezmoi
alias cm="chezmoi"
alias cms="chezmoi status"
alias cmd="chezmoi doctor"
alias cma="chezmoi add"
alias cme="chezmoi edit"
alias cmea="chezmoi edit --apply"
alias cmew="chezmoi edit --watch"
alias cmap="chezmoi apply"
alias cmu="chezmoi update"
alias cmr="chezmoi re-add"

function cmbak
  if command -v chezmoi > /dev/null
    echo "==> Backing up all files managed by chezmoi..."
    echo "Running chezmoi add ~/.config/nvim/*"
    rm -rf ~/.local/share/chezmoi/dot_config/nvim
    chezmoi add ~/.config/nvim/*
    echo "Running chezmoi add ~/.config/tmux/*"
    rm -rf ~/.local/share/chezmoi/dot_config/tmux/
    chezmoi add ~/.config/tmux/*
    echo "Running chezmoi add ~/.zshrc"
    rm -rf ~/.local/share/chezmoi/dot_zshrc
    chezmoi add ~/.zshrc
    echo "Running chezmoi add ~/Pictures/wallpapers/"
    rm -rf ~/.local/share/chezmoi/private_Pictures
    chezmoi add ~/Pictures/wallpapers/
    echo "Running chezmoi add ~/.config/fish/"
    rm -rf ~/.local/share/chezmoi/dot_config/private_fish/
    chezmoi add ~/.config/fish/
    echo "Running chezmoi add ~/.config/kitty/"
    rm -rf ~/.local/share/chezmoi/dot_config/kitty
    chezmoi add ~/.config/kitty/
  else
    echo "chezmoi is not installed"
    return 1
  end

  switch (uname)
    case Darwin
      echo "MacOS detected"
      if command -v brew > /dev/null
        echo "Running chezmoi add ~/.config/brewfile"
        rm -rf ~/.local/share/chezmoi/dot_config/brewfile
        chezmoi add ~/.config/brewfile
        echo "" > ~/.config/brewfile
        echo "Running brew bundle dump..."
        brew bundle dump -f --file=~/.config/brewfile
      else
        echo "brew is not installed"
        return 1
      end

    case Linux
      echo "Linux OS detected"
      if command -v yay > /dev/null
        echo "Running chezmoi add ~/.config/yay-Qqefile..."
        yay -Qqe > ~/.config/yay-Qqefile
        rm -rf ~/.local/share/chezmoi/dot_config/yay-Qqefile
        chezmoi add ~/.config/yay-Qqefile
      else
        echo "yay not installed"
        return 1
      end

      if command -v pacman > /dev/null
        echo "Running chezmoi add ~/.config/pacman-Qqefile"
        pacman -Qqe > ~/.config/pacman-Qqefile
        rm -rf ~/.local/share/chezmoi/dot_config/pacman-Qqefile
        chezmoi add ~/.config/pacman-Qqefile
      else
        echo "pacman not installed"
        return 1
      end

      echo "Running chezmoi add ~/.config/hypr/"
      rm -rf ~/.local/share/chezmoi/dot_config/hypr/
      chezmoi add ~/.config/hypr/

    case "*"
      echo "This is neither MacOS nor Linux"
      return 1
  end

end  # <-- This is the missing `end` to close the function


function update
  switch (uname)
    case Linux
      echo "Linux OS detected"
      if command -v yay > /dev/null
        echo "running yay..."
        yay
      else
        echo "yay not installed"
        return 1
      end

    case Darwin
      echo "MacOS detected"
      if command -v brew > /dev/null
        echo "Running brew update..."
        brew update --verbose
        echo "Running brew upgrade..."
        brew upgrade --greedy --verbose
        echo "Running brew cleanup..."
        brew cleanup --prune=all -s --verbose
        echo "Running brew autoremove..."
        brew autoremove --verbose
        echo "Running brew reinstall python..."
        brew reinstall python --verbose
        echo "Running brew reinstall python-tk..."
        brew reinstall python-tk --verbose
        echo "Running brew reinstall python-certifi..."
        brew reinstall certifi --verbose
        echo "Running brew reinstall python-gdbm..."
        brew reinstall python-gdbm --verbose
        echo "Running brew reinstall librewolf --no-quarantine..."
        brew reinstall librewolf --no-quarantine --verbose
        echo "Running rustup update..."
        rustup update
        echo "Running brew cleanup..."
        brew cleanup --prune=all -s --verbose
        echo "Running brew autoremove..."
        brew autoremove --verbose
      else
        echo "brew not installed"
        return 1
      end
    case DragonFly '*BSD'
      echo "BSD"
    case '*'
      echo "WTF is this OS"
  end
end


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


zoxide init fish | source
