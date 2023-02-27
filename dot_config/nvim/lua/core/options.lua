---@diagnostic disable: assign-type-mismatch
local o = vim.opt

o.relativenumber = true
o.number = true

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

o.ignorecase = true
o.smartcase = true

o.cursorline = true

o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

o.backspace = "indent,eol,start"

o.clipboard:append("unnamedplus")

o.splitright = true
o.splitbelow = true

o.iskeyword:append("-")

o.timeout = true
o.timeoutlen = 500

o.laststatus = 3
