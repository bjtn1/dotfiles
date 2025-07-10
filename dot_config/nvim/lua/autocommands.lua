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
vim.cmd([[
  augroup vimtex_event_focus
  autocmd!
  autocmd User VimtexEventViewReverse lua TexFocusNeovim()
  augroup END
]])

-- Open Telescope find_files on enter
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if vim.fn.argv(0) == "" then
--       require("telescope.builtin").find_files()
--     end
--   end,
-- })
