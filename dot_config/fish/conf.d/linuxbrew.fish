# Puts Homebrew's Linux install on PATH (see .chezmoiscripts/run_once_10).
# No-op on macOS, which has its own separate Homebrew install already on
# PATH via /opt/homebrew.
if test (uname) = Linux; and test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
