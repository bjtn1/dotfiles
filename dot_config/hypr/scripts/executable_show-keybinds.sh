#!/bin/bash
# Which-key-style keybind cheatsheet: lists every bind that has a "Category: Label"
# description set, via `hyprctl binds`'s plain-text output (not -j: some bind args
# contain pipes/quotes that break Hyprland's own JSON serialization), grouped by
# category, and shows it in fuzzel (rofi is gone).
#
# Pressing the keybind again while it's open closes it instead of stacking.

if pkill -x fuzzel 2>/dev/null; then
  exit 0
fi

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

# category -> newline-separated "key  →  label" lines
declare -A by_category

flush() {
  if [ -n "$desc" ]; then
    local mods combo category label
    mods=$(decode_mods "${modmask:-0}")
    if [ -n "$mods" ]; then
      combo="$mods + $key"
    else
      combo="$key"
    fi

    if [[ "$desc" == *": "* ]]; then
      category="${desc%%: *}"
      label="${desc#*: }"
    else
      category="Other"
      label="$desc"
    fi

    local line
    line=$(printf "%-22s →  %s" "$combo" "$label")
    by_category["$category"]+="$line"$'\n'
  fi
  modmask=""
  key=""
  desc=""
}

{
  while IFS= read -r line; do
    trimmed="${line#"${line%%[![:space:]]*}"}"
    case "$trimmed" in
      bind*|mouse|unbind)
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
}

# Fixed, readable category order; anything else (e.g. "Other") gets appended after
order=(System Apps Windows Workspaces Wallpaper Utility Media Other)

{
  for category in "${order[@]}"; do
    if [ -n "${by_category[$category]}" ]; then
      printf "── %s ──\n" "$category"
      printf "%s" "${by_category[$category]}" | sort -u
      unset "by_category[$category]"
    fi
  done

  # Any category not in the fixed order (shouldn't normally happen)
  for category in "${!by_category[@]}"; do
    printf "── %s ──\n" "$category"
    printf "%s" "${by_category[$category]}" | sort -u
  done
} | fuzzel --dmenu --prompt "Keybinds> "
