return {
  "nvim-treesitter/nvim-treesitter",
  priority = 1000,
  version = false,
  build = ":TSUpdate",
  config = function ()
    -- nvim-treesitter v1.0 removed the `configs` module. highlight and indent
    -- are now handled automatically by nvim's filetype system once parsers are
    -- installed. Use :TSInstall <lang> or :TSUpdate to manage parsers.
    require("nvim-treesitter").setup()

    -- vimtex owns latex highlighting; stop treesitter from taking over
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "tex", "latex" },
      callback = function()
        vim.treesitter.stop()
      end,
    })
  end
}
