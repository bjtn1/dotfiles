-- You wrote this to be able to return focus to Neovim after inverse search on macOS:
-- Src = https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/#refocus-nvim-macos-inverse
function TexFocusNeovim()
  -- Replace 'TERMINAL' with the name of your terminal application
  -- Example: vim.fn.system('open -a iTerm')
  -- Example: vim.fn.system('open -a Alacritty')
  vim.fn.system('open -a kitty')
  vim.cmd('redraw!')
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

-- Enforce 50/72 rule for git commit messages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
    vim.opt_local.colorcolumn = "51,73"
  end,
})

-- Hide line numbers on dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.statuscolumn = ""
  end,
})