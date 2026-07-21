-- Hyprland Lua config. See https://wiki.hypr.land/Configuring/Start/
-- Migrated from hyprland.conf + conf/*.conf. Originals left untouched as a
-- fallback (Hyprland loads this file instead of hyprland.conf automatically).

require("conf.environment-variables")

-- monitors
require("conf.monitors")

-- windows / decorations / animations
require("conf.windows")
require("conf.decorations")
require("conf.animations")

-- input
require("conf.input")

-- window rules
require("conf.windowrules")

-- keybinds
require("conf.keybinds")

-- autostart apps
require("conf.autostart")
