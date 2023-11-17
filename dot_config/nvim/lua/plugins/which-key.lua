return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      window = {
        border = "single"
      },
      layout = {
        spacing = 10,
        align = "left",
      }
    })
  end
}
