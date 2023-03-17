return {
  "nvim-treesitter/nvim-treesitter",
  priority = 1000,
  version = false,
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = "python",
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = true,
      },
    auto_install = true,
    })
  end
}
