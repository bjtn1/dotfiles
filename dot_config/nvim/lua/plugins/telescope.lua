return {
  "nvim-telescope/telescope.nvim",
  -- Pinned instead of tracking `branch = "master"`: master now requires
  -- Nvim 0.11+ (this system, and Debian trixie in general, is on 0.10.4 --
  -- no newer package exists yet). v0.2.2 is the latest tag that still only
  -- requires 0.10.4. Bump this once Nvim is upgraded to 0.11+.
  tag = "v0.2.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    -- not maintained at all
    -- "ahmedkhalf/project.nvim",
  },
  config = function ()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    -- local telescope_project = require("project_nvim")

    -- telescope_project.setup {
    --   -- your configuration comes here
    --   -- or leave it empty to use the default settings
    --   -- refer to the configuration section below
    -- }
    telescope.setup({
      defaults = {
        preview = {
          treesitter = false,
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { width = 0.99, height = 0.99 },
        },
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
    -- require('telescope').load_extension('projects')
  end
}
