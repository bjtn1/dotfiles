return
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
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
          z = { fg = colors.green, bg = colors.grey },
        },

        insert = { a = { fg = colors.black, bg = colors.green } },
        visual = { a = { fg = colors.black, bg = colors.violet } },
        replace = { a = { fg = colors.black, bg = colors.red } },
      }

      require('lualine').setup {
        options = {
          theme = theme,
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = { 'filename' },
          lualine_c = { "branch" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end
  }
