return
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and "  "
              or (e == "warning" and "  " or "  " )
              s = s .. n .. sym
            end
            return s
          end,
          indicator = {
            style = "icon",
          },
          numbers = "ordinal",
          offsets = {
            {
              filetype = "NeoTree",
              text = "File Explorer",
              text_align = "left", -- | "center" | "right"
              separator = true
            }
          },
        },
      })
    end,
  }
