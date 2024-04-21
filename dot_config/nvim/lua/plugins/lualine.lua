return
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "archibate/lualine-time"
    },
    config = function ()
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
        },

        insert = { a = { fg = colors.black, bg = colors.green } },
        visual = { a = { fg = colors.black, bg = colors.violet } },
        replace = { a = { fg = colors.black, bg = colors.red } },
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
        sections = {
          lualine_a = {
            {
              "filename",
              separator = {
                left = ""
              },
              right_padding = 2
            },
          },
          lualine_b = {
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            }
          },
          lualine_c = {
            "branch"
          },
          -- source:
          -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
          lualine_x = {

          },
          lualine_y = {
            "cdate"
          },
          lualine_z = {
            "ctime"
          },
        },
      }
    end
  }
