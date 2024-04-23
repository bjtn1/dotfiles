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
      black = "#1a1b26",
      white = "#c8d3f5",
      red = "#f38ba8",
      violet = "#c099ff",
      grey = "#313244",
      green = "#c3e88d",
    }

    local theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.green, bg = colors.grey },
        c = { fg = colors.green, bg = colors.black },
        x = { fg = colors.black, bg = colors.blue },
        y = { fg = colors.blue, bg = colors.grey },
        z = { fg = colors.green, bg = colors.black },
      },
    }

    lualine.setup({
      options = {
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- If you want rounded separators use
        -- 
        -- 
        -- section_separators = "|",
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {
          "filename",
        },
        lualine_b = {
          "branch",
        },
        lualine_c = {
          {
            "navic",
            color_correctino = "static",
            padding = {
              left = 1,
              right = 1,
            },
            navic_opts = {
              highlight = true,
              icons = {
                File = " ",
                Module = " ",
                Namespace = " ",
                Package = " ",
                Class = " ",
                Method = " ",
                Property = " ",
                Field = " ",
                Constructor = " ",
                Enum = " ",
                Interface = " ",
                Function = " ",
                Variable = " ",
                Constant = " ",
                String = " ",
                Number = " ",
                Boolean = " ",
                Array = " ",
                Object = " ",
                Key = " ",
                Null = " ",
                EnumMember = " ",
                Struct = " ",
                Event = " ",
                Operator = " ",
                TypeParameter = " ",
              },
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
