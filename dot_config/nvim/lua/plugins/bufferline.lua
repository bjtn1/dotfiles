return {
  "akinsho/bufferline.nvim",
  -- version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        indicator = {
          style = "icon",
        },
        numbers = "ordinal",
        offsets = {
          {
            filetype = "NeoTree",
            text = "File Explorer",
            text_align = "left", -- | "center" | "right"
            separator = true,
          },
        },
      },
    })
  end,
}
