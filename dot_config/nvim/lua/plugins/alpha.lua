return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function ()
    local dashboard = require("alpha.themes.dashboard")
    local alpha = require("alpha")
    dashboard.section.header.val = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }
    dashboard.section.buttons.val = {
      dashboard.button("c", " Edit config", "<cmd>cd ~/.config/nvim |edit ~/.config/nvim/init.lua<cr>"),
      dashboard.button("l", " Restore last session", "<cmd>lua require(\"persistence\").load({last = true})<cr>"),
      dashboard.button("f", " Find file in cwd", "<cmd>Telescope find_files()<cr>"),
      dashboard.button("r", " Find recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("p", " Open recent projects", "<cmd>Telescope projects<cr>"),
      dashboard.button("q", " Quit Neovim", "<cmd>qa!<cr>"),
    }
    alpha.setup(dashboard.config)
  end
}
