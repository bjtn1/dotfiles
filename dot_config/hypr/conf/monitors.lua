-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Left to right: DP-2 (Asus 200Hz), DP-1 (Dell 60Hz), HDMI-A-1 (TV)
hl.monitor({ output = "DP-1", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "preferred", position = "1920x0", scale = 1 })

-- TV: EDID reports a tiny physical size, so Hyprland's "auto" scale heuristic
-- was guessing 2x (blurry upscaled 1080p) -- pin it to native 1:1 scale.
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "3840x0", scale = 1 })

-- fallback for any other monitor plugged in
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
