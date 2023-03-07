return {
  "folke/which-key.nvim",
  opts = {
    window = {
      border = "single"
    },
  },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup(opts)
  end
}
