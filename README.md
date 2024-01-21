These are my personal dotfiles managed by chezmoi. Pics coming soon

# Synopsis

~~Most of everything I've downloaded with homebrew. However, some things I've had to download the intended way.~~
This has to be updated LOL

# Changing right-command key to ctrl key on mac
> [Source](https://hidutil-generator.netlify.app/)
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.KeyRemapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>{"UserKeyMapping":[
            {
              "HIDKeyboardModifierMappingSrc": 0x7000000E7,
              "HIDKeyboardModifierMappingDst": 0x7000000E4
            }
        ]}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

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
