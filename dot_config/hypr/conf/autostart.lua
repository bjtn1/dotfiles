-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
  -- polkit agent (Plasma's own agent is tied to the Plasma session, not this one)
  hl.exec_cmd("hyprpolkitagent")

  -- enable hypridle
  hl.exec_cmd("systemctl --user enable --now hypridle.service")

  -- waybar replaced by noctalia-shell
  -- hl.exec_cmd("waybar")

  -- enable noctalia-shell (bar, launcher, clipboard, wallpaper, colors)
  hl.exec_cmd("qs -c noctalia-shell")

  -- pipeweaver: Wave Link-style audio mixer/router (Scarlett Solo). Runs in
  -- the background with a tray icon; open the mixer via the tray, the
  -- "Pipeweaver" app launcher entry, or `pipeweaver-app`.
  hl.exec_cmd("pipeweaver-daemon --background")

  -- wallpaper now fully owned by noctalia-shell (restores its own last-set
  -- wallpaper on startup) — hyprpaper/waypaper no longer needed here

  -- run the script to check if keychron v1 max is connected or not
  -- this doesn't really work LMFAO
  -- swap_caps_lock_to_esc script removed

  -- open these apps in these workspaces
  hl.exec_cmd("kitty", { workspace = "1 silent" })
  -- hl.exec_cmd("librewolf", { workspace = "2 silent" })
  -- hl.exec_cmd("mullvad-browser", { workspace = "2 silent" })

  -- for cliphist
  hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
  hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
end)
