-- TODO
-- FIX
-- NOTE
-- WARN
-- TEST
-- HACK

-- This disables netrw
vim.g.loaded_netrw       = 1
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

local color = "tokyonight-night"

vim.cmd.colorscheme(color)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.opt.fillchars:append("eob: ")

print("hello from init")
