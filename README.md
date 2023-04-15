These are my personal dotfiles managed by chezmoi. Pics coming soon

# Synopsis

Most of everything I've downloaded with homebrew. However, some things I've had to download the intended way.

# Non-homebrew stuff

## NPM (Node package manager) and NVM (Node version manager)

### Instaling NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
```

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
```

### Installing node and npm

```bash
nvm install --lts
```

```bash
nvm use --lts
```

## Rust and Rustup

> ❗️ Make sure ~/Workspace/rust-speedrun/ exists before running this command

```bash
curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh | bash -s ~/Workspace/rust-speedrun
```

### Rustlings (Small interactive rust lessons)

```bash
curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh | bash -s ~/Workspace/rust-speedrun/rustlings
```
