return {
  "nvim-treesitter/nvim-treesitter",
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
      ensure_installed = "all",
    })
  end
}
