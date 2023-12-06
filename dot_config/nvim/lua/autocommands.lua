-- You wrote this to be able to return focus to Neovim after inverse search on macOS:
-- Src = https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/#refocus-nvim-macos-inverse
function TexFocusNeovim()
  -- Replace 'TERMINAL' with the name of your terminal application
  -- Example: vim.fn.system('open -a iTerm')
  -- Example: vim.fn.system('open -a Alacritty')
  vim.fn.system('open -a TERMINAL')
  vim.api.nvim_command('redraw!')
end

-- Define the autocmd group
vim.api.nvim_exec([[
  augroup vimtex_event_focus
    autocmd!
    autocmd User VimtexEventViewReverse lua TexFocusNeovim()
  augroup END
]], false)
