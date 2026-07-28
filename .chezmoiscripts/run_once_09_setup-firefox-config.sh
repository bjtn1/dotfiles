#!/bin/bash
# Applies the tracked user.js (see .config/firefox-custom/) to Firefox's
# default profile. On a fresh install Firefox has never run, so there's no
# profile yet -- briefly launch it headless just to create one, then apply.
# Runs once per machine.
[[ "$(uname -s)" == "Linux" ]] || exit 0
command -v firefox &>/dev/null || exit 0

INI="$HOME/.config/mozilla/firefox/profiles.ini"

if [[ ! -f "$INI" ]]; then
    echo ">>> No Firefox profile yet -- launching headless briefly to create one..."
    firefox --headless &>/dev/null &
    fx_pid=$!
    for _ in $(seq 1 30); do
        [[ -f "$INI" ]] && break
        sleep 0.5
    done
    kill "$fx_pid" 2>/dev/null || true
    wait "$fx_pid" 2>/dev/null || true
fi

APPLY_SCRIPT="$HOME/.config/scripts/apply-firefox-config"
if [[ -x "$APPLY_SCRIPT" ]]; then
    echo ">>> Applying Firefox user.js..."
    "$APPLY_SCRIPT" || echo ">>> Firefox profile still not ready -- run $APPLY_SCRIPT manually later."
fi
