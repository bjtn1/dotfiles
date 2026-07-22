-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
  -- polkit agent (Plasma's own agent is tied to the Plasma session, not this one)
  hl.exec_cmd("hyprpolkitagent")

  -- enable hypridle
  hl.exec_cmd("systemctl --user enable --now hypridle.service")

  -- enable waybar (no systemd unit ships with the Arch package, so launch it directly)
  hl.exec_cmd("waybar")

  -- hyprpaper must be running in the background for waypaper's hyprpaper backend to work
  hl.exec_cmd("hyprpaper")

  -- set a random wallpaper on boot
  hl.exec_cmd("waypaper --folder ~/.config/wallpapers/ --random")

  -- change the color scheme (according to previous command's wallpaper)
  -- not loving this anymore, i want a static wallpaper and to be able to change it myself
  -- randomize-wallpaper script removed

  -- run the script to check if keychron v1 max is connected or not
  -- this doesn't really work LMFAO
  -- swap_caps_lock_to_esc script removed

  -- open these apps in these workspaces
  hl.exec_cmd("kitty", { workspace = "1 silent" })
  -- hl.exec_cmd("librewolf", { workspace = "2 silent" })
  hl.exec_cmd("mullvad-browser", { workspace = "2 silent" })

  -- for cliphist
  hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
  hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
end)
