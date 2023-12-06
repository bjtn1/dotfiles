-- " You're gonna ask where this came from....
-- " It comes from here:
-- " https://www.ejmastnak.com/tutorials/vim-latex/vimtex/
-- " You added this because you wanted to try LaTeX for math on nvim
return {
  "lervag/vimtex",
  ft = "tex",
  dependencies = {

  },
  config = function ()
    vim.g["vimtex_quickfix_open_on_warning"] = 0
  end
}
