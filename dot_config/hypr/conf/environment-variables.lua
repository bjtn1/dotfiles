-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Qt apps (dolphin, etc.): read kdeglobals for palette, wal-themed via
-- wal/templates/colors-kdeglobals.sh
hl.env("QT_QPA_PLATFORMTHEME", "kde")
