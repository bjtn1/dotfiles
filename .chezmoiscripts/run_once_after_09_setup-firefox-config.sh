#!/bin/bash
# Applies the tracked user.js (see .config/firefox-custom/) to Firefox's
# default profile. On a fresh install Firefox has never run, so there's no
# profile yet -- briefly launch it headless just to create one, then apply.
# Runs once per machine.
# _after_: reads dot_config/firefox-custom/* and calls
# dot_config/scripts/apply-firefox-config, none of which exist yet on a
# fresh machine in a plain run_once_ script.
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

# Open each tracked extension's AMO page so they can be installed with one
# click. Only makes sense with an actual display to show it on.
EXT_FILE="$HOME/.config/firefox-custom/extensions.txt"
if [[ -f "$EXT_FILE" && -n "${DISPLAY:-}${WAYLAND_DISPLAY:-}" ]]; then
    ext_urls=()
    while IFS='|' read -r id url _name; do
        [[ "$id" =~ ^#.*$ || -z "$url" ]] && continue
        ext_urls+=("$url")
    done < "$EXT_FILE"
    if [[ ${#ext_urls[@]} -gt 0 ]]; then
        echo ">>> Opening extension pages for manual install..."
        firefox "${ext_urls[@]}" &>/dev/null &disown
    fi
fi
