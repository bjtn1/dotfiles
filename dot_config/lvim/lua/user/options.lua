--------------------- 
-- Line numbers
---------------------
vim.opt.relativenumber = true

---------------------
-- Tabs and indentation
---------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

---------------------
-- Appearance
---------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

---------------------
-- Search settings
---------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true

---------------------
-- Miscellaneous
---------------------
vim.opt.wrap = false
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.iskeyword:append("-")

---------------------
-- Windows
---------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

---------------------
-- Plugin activate/deactivate
---------------------
lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true

---------------------
-- Lualine
---------------------
lvim.builtin.lualine.style = "default" -- or "none"

---------------------
-- I don't know what to call this, but it's in every starter.lvim file
---------------------
lvim.lsp.diagnostics.virtual_text = true

---------------------
-- This is from the Java starer.lvim
---------------------
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.breadcrumbs.active = true

