return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function ()
    local dashboard = require("alpha.themes.dashboard")
    -- TODO configure the dashboard
    require("alpha").setup(dashboard.config)
  end
}
