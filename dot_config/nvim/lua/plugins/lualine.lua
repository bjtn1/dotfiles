return
{
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "archibate/lualine-time"
  },
  config = function()
    -- Inspired by...
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua
    -- Bubbles config for lualine
    -- Author: lokesh-krishna
    -- MIT license, see LICENSE for more details.

    -- stylua: ignore
    local colors = {
      blue   = '#82aaff',
      cyan   = '#86e1fc',
      black  = '#1a1b26',
      white  = '#c8d3f5',
      red    = '#f38ba8',
      violet = '#c099ff',
      grey   = '#313244',
      green  = "#c3e88d",
    }

    local theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.blue, bg = colors.grey },
        c = { fg = colors.green, bg = colors.black },
        x = { fg = colors.black, bg = colors.blue },
        y = { fg = colors.blue, bg = colors.grey },
        z = { fg = colors.green, bg = colors.black },
      },

      insert = { b = { fg = colors.green, bg = colors.grey } },
      visual = { b = { fg = colors.violet, bg = colors.grey } },
      replace = { b = { fg = colors.red, bg = colors.grey } },
    }

    require('lualine').setup {
      options = {
        theme = theme,
        component_separators = '|',
        -- If you want rounded separators use
        -- 
        -- 
        section_separators = { left = '', right = '' },
      },
      winbar = {
        lualine_a = {

        },
        lualine_b = {

        },
        lualine_c = {

        },
        lualine_x = {

        },
        lualine_y = {

        },
        lualine_z = {

        }
      },
      sections = {
        lualine_a = {
          -- "mode"
        },
        lualine_b = {
          {
            "filename",
            separator = {
              left = ""
            },
            right_padding = 2
          },
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
                File = ' ',
                Module = ' ',
                Namespace = ' ',
                Package = ' ',
                Class = ' ',
                Method = ' ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = ' ',
                Interface = ' ',
                Function = ' ',
                Variable = ' ',
                Constant = ' ',
                String = ' ',
                Number = ' ',
                Boolean = ' ',
                Array = ' ',
                Object = ' ',
                Key = ' ',
                Null = ' ',
                EnumMember = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' '
              }
            },
          }
        },
        -- source:
        -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
        lualine_x = {

        },
        lualine_y = {
          -- {
          --   require("noice").api.statusline.mode.get,
          --   cond = require("noice").api.statusline.mode.has,
          --   color = { fg = "#ff9e64" },
          -- }
        },
        lualine_z = {
          "branch"
        },
      },
    }
  end
}
