-- NOTE list of all options
-- https://neovim.io/doc/user/quickref.html#option-list

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

-- vim.opt.clipboard:append("unnamedplus")

-- Map 'y' and 'p' to yank and put to the system clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })

vim.api.nvim_set_keymap('n', 'Y', '"+Y', { noremap = true })
vim.api.nvim_set_keymap('v', 'Y', '"+Y', { noremap = true })

vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true })

vim.api.nvim_set_keymap('n', 'P', '"+P', { noremap = true })
vim.api.nvim_set_keymap('v', 'P', '"+P', { noremap = true })

-- -- Map 'd', and 'c' to use the default register, not affecting the system clipboard
-- vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true })

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")

vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.laststatus = 0

vim.opt.guicursor = "i-c-ci-sm:ver25-blinkon100,n-v-ve-o-r-cr:blinkon100"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.fillchars:append("eob: ")
