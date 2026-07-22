-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- DP-2 on the left, DP-1 to its right
hl.monitor({ output = "DP-2", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = 1 })

-- fallback for any other monitor plugged in
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
