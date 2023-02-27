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
vim.g.localleader = " "

local opts = {}

require("lazy").setup('plugins', opts)

require("core.colorscheme")
require("core.keymaps")
require("core.options")

-- require("bnog.plugins.autopairs")
-- require("bnog.plugins.bufferline")
-- require("bnog.plugins.comment")
-- require("bnog.plugins.dashboard")
-- require("bnog.plugins.gitsigns")
-- require("bnog.plugins.indent-blankline")
-- require("bnog.plugins.lualine")
-- require("bnog.plugins.nvim-tree")
-- require("bnog.plugins.project")
-- require("bnog.plugins.telescope")
-- require("bnog.plugins.treesitter")
-- require("bnog.plugins.which-key")

