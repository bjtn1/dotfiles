-- HyprExpo: expose-style workspace overview plugin.
-- Community-maintained continuation of the official plugin (dropped
-- upstream as unmaintained): https://github.com/sandwichfarm/hyprexpo
-- Installed/enabled via hyprpm, not a package -- reinstall after a fresh
-- machine setup with:
--   hyprpm add https://github.com/sandwichfarm/hyprexpo
--   hyprpm enable hyprexpo

hl.config({
  plugin = {
    hyprexpo = {
      columns = 3,
      gaps_in = 5,
      gaps_out = 10,
      bg_col = "rgb(111111)",
      workspace_method = "center current",
      gesture_distance = 200,
      cancel_key = "escape",
      show_cursor = 1,
      keynav_enable = 1,
      keynav_wrap_h = 1,
      keynav_wrap_v = 1,
      keynav_reading_order = 0,
    },
  },
})

-- The plugin switches into this submap itself while the overview is open.
hl.define_submap("hyprexpo", function()
  hl.bind("left", function() hl.plugin.hyprexpo.kb_focus("left") end)
  hl.bind("right", function() hl.plugin.hyprexpo.kb_focus("right") end)
  hl.bind("up", function() hl.plugin.hyprexpo.kb_focus("up") end)
  hl.bind("down", function() hl.plugin.hyprexpo.kb_focus("down") end)
  hl.bind("return", function() hl.plugin.hyprexpo.kb_confirm() end)
  hl.bind("escape", function() hl.plugin.hyprexpo.expo("cancel") end)
end)
