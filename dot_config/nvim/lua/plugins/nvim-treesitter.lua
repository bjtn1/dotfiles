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
        -- "latex",
        "lua",
        "markdown",
        "markdown_inline",
        -- "norg",
        -- "norg_meta",
        "python",
        "rust",
        "typescript",
        "vim"
      },
      highlight = {
        enable = true,
        -- These two lines com from:
        -- https://github.com/lervag/vimtex/issues/2469
        disable = {
          "latex",
        },
        additional_vim_regex_highlighting = { "latex", "markdown" },
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
