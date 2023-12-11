-- " You're gonna ask where this came from....
-- " It comes from here:
-- " https://www.ejmastnak.com/tutorials/vim-latex/vimtex/
-- " You added this because you wanted to try LaTeX for math on nvim
return {
  "lervag/vimtex",
  ft = "tex",
  config = function ()
    vim.g["vimtex_quickfix_open_on_warning"] = 0
    vim.g["vimtex_view_method"] = "skim"
    vim.cmd[[

      let g:vimtex_syntax_packages = {'minted': {'load': 2}}
      let g:vimtex_compiler_latexmk_engines = {
      \ '_'                : '-xelatex',
      \}

      let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-xelatex',
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

      let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

      " -- From:
      " -- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#keymaps
      " Jump forward through tabstops in insert and visual mode with control+j or jk
      imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'
      smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'

      " Jump backward through snippet tabstops with kj or Shift-Tab 
      imap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
      smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    ]]
  end
}

-- NOTE
-- These are commands.mappings that are ueful
-- % SEE `:h vimtex-mapppings` for more mappings
--
-- % dse (Delete surrounding env)
-- \begin{env}
--   Using vimtex is lots of fun
-- \end{env}
--
-- % cse (CHange surrounding env)
-- \begin{equation}
--   a + b &= c\\
--   x + y &= z
--   \label{eq:test}
-- \end{equation}
--
-- % dsc (Delete surrounding command)
-- \textit{Hello, world!}
--
-- % dsd (Delete surrounding delimeter)
-- \left(X + Y\right)
--
-- % csd (Change surrounding delimeter)
-- \left[X + Y\right]
--
-- % ds$ delete surrounding math
-- $ 1 + 1 = 2 $
--
-- % cs$ change surrounding math 
-- $1 + 1 = 2$
--
-- % cs$ change surrounding command
-- \textit{Make me italic!}
--
-- % tsc toggle starred command
-- \section{Toggling}
--
-- % tse toggle starred equation
-- \begin{equation*}
--   a + b &= c\\
--   x + y &= z
--   \label{eq:test}
-- \end{equation*}
--
--
-- % tsd toggle surrounding delimeter
-- \left(x + y\right)
--
-- % tsf toggle surrounding fraction
-- \frac{a}{b}
--
-- % `%` navigate matching content
-- \begin{env}
--   Using vimtex is lots of fun
-- \end{env}
--
-- %  navigate sections
-- \section{First secition}
-- \lipsum[1]
-- \section{Second section}
-- \lipsum[2]
-- \section{third section}
--
-- % ]m navigate environments
--
-- % ]n navigate math zones
--
-- % ]r navigate beamer frames
