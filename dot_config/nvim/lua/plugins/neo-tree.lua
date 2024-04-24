return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local neotree = require("neo-tree")

    neotree.setup({
      close_if_last_window = true,
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.cmd("setlocal relativenumber")
          end,
        },
      },
      window = {
        mappings = {
          ["<space>"] = false,
          -- source
          -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Tips/#open-file-without-losing-sidebar-focus
          ["<cr>"] = function(state)
            local node = state.tree:get_node()
            if require("neo-tree.utils").is_expandable(node) then
              state.commands["toggle_node"](state)
            else
              state.commands["open"](state)
              vim.cmd("Neotree reveal")
            end
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = false,
        },
      },
    })
  end,
}
