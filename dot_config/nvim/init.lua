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
    colorscheme = { "tokyonight-night" },
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

local transparent_backgrounds = {
  "tokyonight-mooon",
  "rose-pine",
  "catppuccin-mocha",
}

local color = "catppuccin-mocha"

vim.cmd.colorscheme(color)
