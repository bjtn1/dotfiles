-- src = ttps://github.com/mylinuxforwork/dotfiles/blob/main/share/dotfiles/.config/hypr/conf/windowrules/default.conf
-- -----------------------------------------------------
-- Window rules
-- -----------------------------------------------------

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland
hl.window_rule({
  match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true,
})

-- have waypaper open as a floating window in the center
hl.window_rule({ match = { class = "waypaper" }, maximize = true })

hl.window_rule({ match = { title = "^(Microsoft-edge)$" }, tile = true })
hl.window_rule({ match = { title = "^(Brave-browser)$" }, tile = true })
hl.window_rule({ match = { title = "^(Chromium)$" }, tile = true })
hl.window_rule({ match = { title = "^(pavucontrol)$" }, float = true })
hl.window_rule({ match = { title = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { title = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { title = "^(qalculate-gtk)$" }, float = true })

-- i like it when kitty is semi-transparent
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.85 override" })

-- Browser Picture in Picture
hl.window_rule({
  match = { title = "^(Picture-in-Picture)$" },
  float = true,
  pin = true,
  move = {"69.5%", "4%"},
})

-- idleinhibit. Available modes: none, always, focus, fullscreen
-- NOTE: class:([window]) is a literal unfilled placeholder carried over from the old
-- config as-is -- it won't match any real window until the class name is fixed.
hl.window_rule({ match = { class = "([window])" }, idle_inhibit = "fullscreen" })
