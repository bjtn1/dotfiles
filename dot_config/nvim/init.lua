local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local opts = {
  install = {
    colorscheme = {"tokyonight-night"},
  },
  ui = {
    border = "single",
  },
  checker = {
    enabled = true,
  },
}

require("options")
require("lazy").setup("plugins", opts)
require("keymaps")

vim.cmd([[
  colorscheme ayu-dark
  
  " highlight Visual guifg=#15161e guibg=#7aa2f7 gui=none

  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
  augroup END
]])
