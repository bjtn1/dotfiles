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
    vim.g["vimtex_view_method"] = "skim"
    vim.cmd[[
    let g:vimtex_syntax_packages = {'minted': {'load': 2}}
    ]]
    vim.cmd[[
      let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]
      ]]
    vim.cmd[[
    let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
    ]]
    -- From:
    -- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#keymaps
    vim.cmd[[
    " Jump forward through tabstops in insert and visual mode with control+j or jk
    imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'
    smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'

    " Jump backward through snippet tabstops with kj or Shift-Tab 
    imap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

    ]]
  end
}
