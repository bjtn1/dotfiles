#!/bin/bash
# Which-key-style keybind cheatsheet: lists every bind that has a description set,
# via `hyprctl binds`'s plain-text output (not -j: some bind args contain pipes/quotes
# that break Hyprland's own JSON serialization), and shows it in rofi.

decode_mods() {
  local m=$1
  local parts=()
  (( m & 1 ))  && parts+=("SHIFT")
  (( m & 4 ))  && parts+=("CTRL")
  (( m & 8 ))  && parts+=("ALT")
  (( m & 64 )) && parts+=("SUPER")
  local out=""
  for p in "${parts[@]}"; do
    out="${out:+$out + }$p"
  done
  echo "$out"
}

modmask=""
key=""
desc=""

flush() {
  if [ -n "$desc" ]; then
    local mods
    mods=$(decode_mods "${modmask:-0}")
    if [ -n "$mods" ]; then
      printf "%s + %s  →  %s\n" "$mods" "$key" "$desc"
    else
      printf "%s  →  %s\n" "$key" "$desc"
    fi
  fi
  modmask=""
  key=""
  desc=""
}

{
  while IFS= read -r line; do
    trimmed="${line#"${line%%[![:space:]]*}"}"
    case "$trimmed" in
      bind|mouse|unbind)
        flush
        ;;
      modmask:*)
        modmask="${trimmed#modmask: }"
        ;;
      key:*)
        key="${trimmed#key: }"
        ;;
      description:*)
        desc="${trimmed#description: }"
        ;;
    esac
  done < <(hyprctl binds)
  flush
} | sort -u | rofi -dmenu -i -p "Keybinds"
