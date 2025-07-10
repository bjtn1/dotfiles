# start a tmux in every session
# src = https://www.baeldung.com/linux/tmux-startup-default-shell
# if type -q tmux
#     if not test -n "$TMUX"
#         tmux attach-session -t default; or tmux new-session -s default
#     end
# end
# fastfetch

if status is-interactive
  # Commands to run in interactive sessions can go here
end

# this removes the greeting when fish shell is first launched
set -U fish_greeting
set -gx EDITOR nvim

# remap caps lock to escape
# does not work on Xwayland
switch (uname)
  case Linux:
    setxkbmap -option "caps:escape"
end

# yay
alias yaybak="yay && yay -Qqe > ~/.config/yay-Qqefile.txt"

# fastfetch
alias ff="fastfetch"

# gcc
alias gcc="/opt/homebrew/Cellar/gcc/14.2.0_1/bin/aarch64-apple-darwin24-c++-14"

alias config="cd ~/.config/"
alias fishconfig="chezmoi edit -a ~/.config/fish/config.fish"
alias l="eza --oneline --long --all --header --git --git-repos --classify=always --icons=always --group-directories-first --no-quotes --hyperlink --group"
alias cl="clear"
alias nv="nvim"
alias kittyconf="nv ~/.config/kitty/kitty.conf"
# alias ip='ipconfig getifaddr en0'
alias activate="source ./bin/activate"
alias login-items="sfltool dumpbtm"
alias lg="lazygit"
alias e="exit"
# alias lv="lvim"
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
alias pdb="python3 -m pdb"

# homebrew
alias bi="brew install"
alias bic="brew install --cask"
alias bu="brew uninstall"
alias buc="brew uninstall --cask"
alias bri="brew reinstall"
alias bric="brew reinstall --cask"
alias brewbak="brew bundle dump -f --file=~/.config/brewfile"

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

# this function backsup everything managed by chezmoi
function pacbak
  if command -v chezmoi > /dev/null
    echo "==> Backing up all files managed by chezmoi..."

    # nvim config
    echo "Running chezmoi add ~/.config/nvim/*"
    rm -rf ~/.local/share/chezmoi/dot_config/nvim
    chezmoi add ~/.config/nvim/*

    # tmux config
    echo "Running chezmoi add ~/.config/tmux/*"
    rm -rf ~/.local/share/chezmoi/dot_config/tmux/
    chezmoi add ~/.config/tmux/*

    # wallpapers
    # echo "Running chezmoi add ~/.config/wallpapers/"
    # rm -rf ~/.local/share/chezmoi/private_Pictures
    # chezmoi add ~/.config/wallpapers/

    # fish shell config
    echo "Running chezmoi add ~/.config/fish/"
    rm -rf ~/.local/share/chezmoi/dot_config/private_fish/
    chezmoi add ~/.config/fish/

    # kitty config
    echo "Running chezmoi add ~/.config/kitty/"
    rm -rf ~/.local/share/chezmoi/dot_config/kitty
    chezmoi add ~/.config/kitty/

    # hypr config
    echo "Running chezmoi add ~/.config/hypr/"
    rm -rf ~/.local/share/chezmoi/dot_config/hypr/
    chezmoi add ~/.config/hypr/

    # waybar config
    echo "Running chezmoi add ~/.config/waybar/"
    rm -rf ~/.local/share/chezmoi/dot_config/waybar/
    chezmoi add ~/.config/waybar/
  else
    echo "chezmoi is not installed"
    return 1
  end

  switch (uname)
  case Darwin
    echo "MacOS detected"
    if command -v brew > /dev/null
      set filename ~/.config/macos_brew_packages.txt
      echo "Running brew bundle dump..."
      brew bundle dump -f --file=$filename
      rm -rf ~/.local/share/chezmoi/dot_config/(basename $filename)
      chezmoi add $filename
    else
      echo "brew is not installed"
      return 1
    end

  case Linux
    echo "Linux OS detected"

    # Get distro name (e.g., arch, ubuntu, debian)
    set distro (string lower (awk -F= '$1=="ID" { print $2 }' /etc/os-release | tr -d '"'))

    if command -v yay > /dev/null
      set filename ~/.config/{$distro}_yay_packages.txt
      yay -Qqe > $filename
      rm -rf ~/.local/share/chezmoi/dot_config/(basename $filename)
      chezmoi add $filename
    else
      echo "yay not installed"
    end

    if command -v pacman > /dev/null
      set filename ~/.config/{$distro}_pacman_packages.txt
      pacman -Qqe > $filename
      rm -rf ~/.local/share/chezmoi/dot_config/(basename $filename)
      chezmoi add $filename
    else
      echo "pacman not installed"
    end

  case "*"
    echo "This is neither MacOS nor Linux"
    return 1
  end
end


# this just updates all currenlty installed pakcages managed by a package manager (homebrew, yay, pacman, etc...)
function update
  switch (uname)
    case Linux
      echo "Linux OS detected"
      if command -v yay > /dev/null
        # update all currently installed packages managed by yay
        echo "running yay..."
        yay
        eos-update
        eos-update --aur

      else
        echo "yay not installed"
        return 1
      end

    case Darwin
      echo "MacOS detected"
      # update all currently installed packages managed by homebrew
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

  # run pacback to backsup everything managed by chezmoi
  pacbak

end


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias cd="z"
zoxide init fish | source
