return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      win = {
        border = MY_BORDER,
      },
      layout = {
        spacing = 10,
        align = "left",
      },
    })
  end,
}
