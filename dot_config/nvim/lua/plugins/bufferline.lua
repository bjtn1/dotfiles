return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        indicator = {
          style = "none",
        },
        color_icons = true,
        -- separator_style = "padded_slant",
      },
      -- fix i dont know how to fix this
      highlights = {
        fill = {
          bg = {
            attribute = "fg",
            highlight = "Pmenu"
          }
        }
      }
    })
  end
}
