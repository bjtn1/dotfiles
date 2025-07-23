# set caps lock to esc when my keychron V1 Max is not connected
set keychron_string (lsusb | grep Keychron)

# if string above is non-zero that means keychron is connected
# so "turn off" the hyprland setting
if test -n keychron_string
  sed -i "s/kb_options = caps:swapescape/#kb_options = caps:swapescape" ~/.config/hypr/conf/caps_lock_to_escape.conf
  # otherwise "turn on" the kb_options hyprland setting
else
  sed -i "s/#kb_options = caps:swapescape/kb_options = caps:swapescape" ~/.config/hypr/conf/caps_lock_to_escape.conf
end


# apply new theme to terminals with pywal16
if test -e ~/.cache/wal/sequences
  cat ~/.cache/wal/sequences
end

function v --description 'Open nvim with files selected by fzf'
  set files (fzf --preview 'bat --color=always --style=header,grid --line-range :400 {}')
  if test -n "$files"
    nvim $files
  end
end

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

# fastfetch
alias ff="fastfetch"

# pfetch
alias pf="pfetch && wal --preview"

# gcc
alias gcc="/opt/homebrew/Cellar/gcc/14.2.0_1/bin/aarch64-apple-darwin24-c++-14"

alias config="cd ~/.config/"
alias fishconfig="chezmoi edit -a ~/.config/fish/config.fish"
alias l="eza --oneline --long --all --header --git --git-repos --classify=always --icons=always --group-directories-first --no-quotes --hyperlink --group"
alias cl="clear"
alias nv="nvim"
alias n="nvim"
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
