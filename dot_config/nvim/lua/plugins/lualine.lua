return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "archibate/lualine-time"
  },
  config = function()
    local lualine = require("lualine")

    -- Inspired by...
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua
    -- Bubbles config for lualine
    -- Author: lokesh-krishna
    -- MIT license, see LICENSE for more details.

    local colors = {
      blue = "#82aaff",
      cyan = "#86e1fc",
      -- black = "#1a1b26",
      black = "#000000",
      white = "#c8d3f5",
      red = "#f38ba8",
      violet = "#c099ff",
      grey = "#313244",
      green = "#c3e88d",
    }

    local theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.green, bg = colors.black },

        x = { fg = colors.black, bg = colors.black },
      },

      insert = {
        a = { fg = colors.black, bg = colors.green },
      },

      visual = {
        a = { fg = colors.black, bg = colors.violet },
      },

      replace = {
        a = { fg = colors.black, bg = colors.red },
      },
    }

    lualine.setup({
      options = {
        theme = theme,
        component_separators = "",
        section_separators = "",
      },
      winbar = {
        lualine_a = {
          -- {
          --   "navic",
          --   color_correctino = "static",
          --   padding = {
          --     left = 1,
          --     right = 1,
          --   },
          --   navic_opts = {
          --     highlight = true,
          --     icons = {
          --       File = " ",
          --       Module = " ",
          --       Namespace = " ",
          --       Package = " ",
          --       Class = " ",
          --       Method = " ",
          --       Property = " ",
          --       Field = " ",
          --       Constructor = " ",
          --       Enum = " ",
          --       Interface = " ",
          --       Function = " ",
          --       Variable = " ",
          --       Constant = " ",
          --       String = " ",
          --       Number = " ",
          --       Boolean = " ",
          --       Array = " ",
          --       Object = " ",
          --       Key = " ",
          --       Null = " ",
          --       EnumMember = " ",
          --       Struct = " ",
          --       Event = " ",
          --       Operator = " ",
          --       TypeParameter = " ",
          --     },
          --   },
          -- },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "filename",
        },
        lualine_c = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_x = {
          -- source:
          -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messagess
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
