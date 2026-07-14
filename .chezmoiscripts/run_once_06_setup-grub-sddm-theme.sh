#!/bin/bash
# Seeds GRUB_THEME line and SDDM Current theme so reb/shu theme randomizers work. Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v pacman &>/dev/null || exit 0

GRUB_CONFIG="/etc/default/grub"
if [[ -f "$GRUB_CONFIG" ]] && ! grep -q '^GRUB_THEME=' "$GRUB_CONFIG"; then
    echo ">>> Adding GRUB_THEME line to $GRUB_CONFIG..."
    echo 'GRUB_THEME=""' | sudo tee -a "$GRUB_CONFIG" > /dev/null
fi

SDDM_CONF_DIR="/etc/sddm.conf.d"
if [[ ! -f "$SDDM_CONF_DIR/theme.conf" ]]; then
    echo ">>> Setting SDDM theme to Sugar-Candy..."
    sudo mkdir -p "$SDDM_CONF_DIR"
    printf '[Theme]\nCurrent=Sugar-Candy\n' | sudo tee "$SDDM_CONF_DIR/theme.conf" > /dev/null
fi

if [[ -x "$HOME/.config/scripts/randomize-grub-theme" ]]; then
    echo ">>> Applying initial grub theme..."
    "$HOME/.config/scripts/randomize-grub-theme" || true
fi

if [[ -x "$HOME/.config/scripts/randomize-sddm-theme" ]]; then
    echo ">>> Applying initial sddm theme..."
    "$HOME/.config/scripts/randomize-sddm-theme" || true
fi
