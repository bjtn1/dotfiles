-- TODO
-- FIX
-- NOTE
-- WARN
-- TEST
-- HACK
-- test

MY_BORDER = "single"

-- This disables netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
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
    colorscheme = { "default" },
  },
  ui = {
    border = "single",
  },
  checker = {
    enabled = true,
  },
  rocks = {
    -- Nothing in this config actually needs luarocks; leaving it enabled
    -- makes lazy.nvim try to bootstrap its own Lua 5.1 via hererocks on
    -- every startup to build neorg's tree-sitter-norg(-meta) rockspecs.
    -- When that bootstrap can't succeed (no working lua5.1/luarocks on the
    -- host, as on this machine), it silently fails and retries each
    -- startup until it hits lazy's 5-round cap and errors with "Too many
    -- rounds of missing plugins". Disabling rocks entirely avoids
    -- depending on any host having a Lua/luarocks build toolchain at all.
    enabled = false,
  },
}

require("options")
require("lazy").setup("plugins", opts)

-- The "wallpaper" colorscheme reads ~/.cache/wal/colors.json (written by
-- pywal when a wallpaper is set) and used to throw a hard error when that
-- file didn't exist -- which aborted the rest of this file, silently
-- skipping keymaps/autocommands/snippets on any machine that's never run
-- pywal (fresh installs, servers, this Docker host). pcall it and fall back
-- to a normal colorscheme so a missing/broken wal cache can never do that
-- again, regardless of what actually goes wrong inside wallpaper.lua.
if not pcall(vim.cmd.colorscheme, "wallpaper") then
  vim.cmd.colorscheme("tokyonight")
end

require("keymaps")
require("autocommands")
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})
