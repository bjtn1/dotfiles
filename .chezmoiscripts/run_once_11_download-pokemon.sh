#!/bin/bash
# One-time bulk download of every Pokemon's fastfetch artwork (all 1025,
# fetched in parallel), so `ff` is instant from the very first use instead
# of hitting PokeAPI on each new Pokemon it hasn't seen yet. Runs once per
# machine; download-all-pokemon itself is safe to re-run any time -- it
# skips anything already cached, so a content change here would only ever
# fetch what's missing anyway.
command -v curl &>/dev/null || exit 0
command -v jq &>/dev/null || exit 0
command -v fastfetch &>/dev/null || exit 0

"$HOME/.config/scripts/download-all-pokemon"
