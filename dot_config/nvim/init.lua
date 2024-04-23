-- TODO
-- FIX
-- NOTE
-- WARN
-- TEST
-- HACK

-- This disables netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

local color = "catppuccin-mocha"

local opts = {
  install = {
    colorscheme = { color },
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

vim.cmd.colorscheme(color)

require("keymaps")
require("autocommands")
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})
