#!/bin/bash
# Seeds GRUB_THEME line and greetd config so reb/shu's grub randomizer and
# noctalia-greeter work. Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

GRUB_CONFIG="/etc/default/grub"
if [[ -f "$GRUB_CONFIG" ]] && ! grep -q '^GRUB_THEME=' "$GRUB_CONFIG"; then
    echo ">>> Adding GRUB_THEME line to $GRUB_CONFIG..."
    echo 'GRUB_THEME=""' | sudo tee -a "$GRUB_CONFIG" > /dev/null
fi

GREETD_CONFIG="/etc/greetd/config.toml"
if command -v greetd &>/dev/null && [[ ! -f "$GREETD_CONFIG" ]]; then
    echo ">>> Writing greetd config for noctalia-greeter..."
    sudo mkdir -p /etc/greetd
    printf '[terminal]\nvt = 1\n\n[default_session]\ncommand = "/usr/bin/noctalia-greeter-session"\nuser = "greeter"\n' | sudo tee "$GREETD_CONFIG" > /dev/null
fi

if command -v greetd &>/dev/null; then
    echo ">>> Enabling greetd, disabling sddm..."
    sudo systemctl disable --now sddm.service 2>/dev/null || true
    sudo systemctl enable greetd.service
fi

if [[ -x "$HOME/.config/scripts/randomize-grub-theme" ]]; then
    echo ">>> Applying initial grub theme..."
    "$HOME/.config/scripts/randomize-grub-theme" || true
fi
