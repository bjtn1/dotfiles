local ooga = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

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

      -- insert = { b = { fg = colors.green, bg = colors.grey } },
      -- visual = { b = { fg = colors.violet, bg = colors.grey } },
      -- replace = { b = { fg = colors.red, bg = colors.grey } },
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
          {
            "filename",
            -- separator = {
            --   left = "",
            -- },
            -- right_padding = 2,
          },
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
        -- source:
        -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
        lualine_x = {},
        lualine_y = {
        },
        lualine_z = {},
      },
    })
  end,
}
