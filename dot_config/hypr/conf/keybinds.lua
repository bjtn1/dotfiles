-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local programs = require("conf.programs")

-- Sets "Windows" key as main modifier
local mainMod = "SUPER"

hl.bind(mainMod .. " + z", hl.dsp.window.tag({ tag = "alpha_0" }))
hl.window_rule({ match = { tag = "alpha_0" }, opacity = "0 override" })

-- call wlogout
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("wlogout"))

-- change orientation with win + alt + enter
hl.bind("SUPER + ALT + return", hl.dsp.layout("togglesplit"))

-- screenshot region with win + shift + s
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- open clipboard manager with rofi
hl.bind("SUPER + V", hl.dsp.exec_cmd("pkill rofi || cliphist list | rofi -dmenu -config ~/.config/rofi/clipboard.rasi | cliphist decode | wl-copy"))

-- kill active window
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"))

-- quit active window
hl.bind("SUPER + Q", hl.dsp.window.close())

-- maximize active window
hl.bind("SUPER + RETURN", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- change to random wallpaper
hl.bind("SUPER + W", hl.dsp.exec_cmd("waypaper --folder ~/.config/wallpapers/ --random"))

-- toggle waybar GUI (to pick a wallpaper)
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("pkill waypaper || waypaper"))
-- hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("pkill rofi || rofi -show -dmenu -config ~/.config/rofi/wallpaper.rasi"))

-- lock screen
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- open terminal
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(programs.terminal))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- launch file manager (dolphin) with WIN + e
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(programs.fileManager))

-- open rofi with WIN + Space
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window"))

-- fullscreen active window with win + enter
-- hl.bind("SUPER + return", hl.dsp.window.fullscreen())

-- launch browser with WIN + B
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser))

-- cycle to the next window with ALT/mainMod + TAB
hl.bind("SUPER + Tab", hl.dsp.window.cycle_next())
hl.bind("SUPER + Tab", hl.dsp.window.alter_zorder({ mode = "top" }))

hl.bind("SUPER + K", hl.dsp.layout("swapsplit"))
hl.bind("SUPER + ALT + left", hl.dsp.window.swap({ direction = "l" }))  -- Swap tiled window left
hl.bind("SUPER + ALT + right", hl.dsp.window.swap({ direction = "r" })) -- Swap tiled window right
hl.bind("SUPER + ALT + up", hl.dsp.window.swap({ direction = "u" }))    -- Swap tiled window up
hl.bind("SUPER + ALT + down", hl.dsp.window.swap({ direction = "d" }))  -- Swap tiled window down

-- Move focus with mainMod + h/j/k/l
-- move left
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
-- move right
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
-- move up
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
-- move down
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Move active window to left/right workspace with mainMod + SHIFT + left/right
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ workspace = "-1" }))

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through existing workspaces with mainMod + left/right
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("ALT + grave", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("F6", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("F5", hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
