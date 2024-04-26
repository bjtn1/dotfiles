return {
  "folke/noice.nvim",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    local noice = require("noice")
    local notify = require("notify")

    noice.setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },

      -- cmdline = {
      --   format = {
      --     search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
      --     search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
      --   },
      -- },
      -- classic cmdline
      cmdline = {
        view = "cmdline",
        format = {
          search_down = {
            view = "cmdline",
            kind = "search",
            pattern = "^/",
            icon = "",
            lang = "regex",
          },
          search_up = {
            view = "cmdline",
            kind = "search",
            pattern = "^%?",
            icon = "",
            lang = "regex",
          },
        },
      },

      -- clean cmdline_popup
      -- views = {
      --   cmdline_popup = {
      --     border = {
      --       style = "none",
      --       padding = { 2, 3 },
      --     },
      --     filter_options = {},
      --     win_options = {
      --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      --     },
      --   },
      -- },

      -- cmdline and popup menu 2.0
      -- views = {
      --   cmdline_popup = {
      --     position = {
      --       row = "40%",
      --       col = "50%",
      --     },
      --     size = {
      --       width = 60,
      --       height = "auto",
      --     },
      --     win_options = {
      --       winhighlight = {
      --         Normal = "Normal",
      --         FloatBorder = "DiagnosticInfo",
      --         FloatTitle = "DiagnosticInfo",
      --       },
      --     },
      --   },
      --   popupmenu = {
      --     border = {},
      --     relative = "editor",
      --     position = {
      --       row = "55%",
      --       col = "50%",
      --     },
      --     size = {
      --       width = 60,
      --       height = 12, --you can set this to any height, even "auto", depending on your preference
      --     },
      --     win_options = {
      --       winblend = 0,
      --       winhighlight = {
      --         Normal = "Normal",
      --         FloatBorder = "DiagnosticInfo",
      --       },
      --     },
      --   },
      -- },

      -- cmdline and popup menu together
      -- views = {
      --   cmdline_popup = {
      --     border = {
      --       style = "rounded",
      --     },
      --     position = {
      --       row = 5,
      --       col = "50%",
      --     },
      --     size = {
      --       width = 60,
      --       height = "auto",
      --     },
      --   },
      --   popupmenu = {
      --     relative = "editor",
      --     position = {
      --       row = 8,
      --       col = "50%",
      --     },
      --     size = {
      --       width = 60,
      --       height = 10,
      --     },
      --     border = {
      --       style = "rounded",
      --       padding = { 0, 1 },
      --     },
      --     win_options = {
      --       winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      --     },
      --   },
      -- },
    })

    notify.setup({
      background_color = "#00000000",
      stages = "static",
    })
  end,
}
