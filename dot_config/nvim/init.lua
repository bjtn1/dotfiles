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


local group = vim.api.nvim_create_augroup(
  "AutoInstallNewLSPs",
  {
    clear = true
  }
)
vim.api.nvim_create_autocmd(
  "BufRead",
  {
    callback = function()
      -- Get file path of current buffer
      -- TODO find the correct evet so that the autocommand gets called anytipe we open a file
      local file_path = vim.api.nvim_buf_get_name(0)
      local file = io.open(file_path, "r")
      if file~=nil then
        print(file_path .. " is a file")
        -- TODO figure out if theres an LSP attached to this buffer
        io.close(file)
        return true
      else
        return false
      end

    end,
    group = group,
  }
)
