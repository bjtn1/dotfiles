return {
  "nvim-treesitter/nvim-treesitter",
  priority = 1000,
  version = false,
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "css",
        "html",
        "java",
        "javascript",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "norg",
        "norg_meta",
        "python",
        "rust",
        "typescript",
        "vim"
      },
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
