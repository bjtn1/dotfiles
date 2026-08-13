#!/bin/bash
# Seeds greetd config so noctalia-greeter works, and disables sddm in favor
# of it. Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

distro_id="$(. /etc/os-release && echo "$ID")"

if [[ "$distro_id" != "cachyos" ]]; then
    echo ">>> Unrecognized distro ($distro_id), skipping greetd setup."
    exit 0
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

PAM_SETUP="/usr/share/noctalia-greeter/setup_greetd_pam.sh"
if [[ -x "$PAM_SETUP" ]]; then
    echo ">>> Patching PAM for noctalia-greeter session tracking..."
    sudo "$PAM_SETUP"
fi
