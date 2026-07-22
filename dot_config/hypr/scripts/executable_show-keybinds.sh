#!/bin/bash
# Which-key-style keybind cheatsheet: lists every bind that has a description set,
# via `hyprctl binds -j`, and shows it in rofi.

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

hyprctl binds -j \
  | jq -r '.[] | select(.description != "" and .description != null) | "\(.modmask)\t\(.key)\t\(.description)"' \
  | while IFS=$'\t' read -r modmask key desc; do
      mods=$(decode_mods "$modmask")
      if [ -n "$mods" ]; then
        printf "%s + %s  →  %s\n" "$mods" "$key" "$desc"
      else
        printf "%s  →  %s\n" "$key" "$desc"
      fi
    done \
  | sort -u \
  | rofi -dmenu -i -p "Keybinds"
