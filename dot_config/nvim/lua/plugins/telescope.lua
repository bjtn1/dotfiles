return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "ahmedkhalf/project.nvim",
  },
  config = function ()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    local telescope_project = require("project_nvim")

    telescope_project.setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          }
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    })
    require('telescope').load_extension('projects')
  end
}
