vim.g.mapleader = " "

local wk = require("which-key")

local n = {mode = "n"}
local i = {mode = "i"}
local v = {mode = "v"}

wk.register({
  ["<leader>="] = {"<C-a>", "Increment number"},
  ["<leader>-"] = {"<C-x>", "Decrement number"},

  ["<leader>h"] = {"<cmd>nohl<CR>", "Clear highlights"},

  ["<leader>s"] = {name = "Window management"},
  ["<leader>sv"] = {"<C-w>v", "Split vertically"},
  ["<leader>sh"] = {"<C-w>v", "Split horizontally"},
  ["<leader>se"] = {"<C-w>v", "Equalize windows"},
  ["<leader>sw"] = {"<cmd>close<CR>", "Close window"},
  ["<leader>sm"] = {"<cmd>MaximizerToggle<CR>", "Maximize window"},

  ["<leader>c"] = {"<cmd>BufDel<CR>", "Close buffer"},

  ["<C-s>"] = {"<cmd>w<CR>", "Save file"},

  ["<leader>e"] = {"<cmd>NvimTreeToggle<CR>", "Toggle file explorer"},

  ["<leader>f"] = {name = "+File"},
  ["<leader>ff"] = {"<cmd>Telescope find_files<cr>", "Find files in pwd"},
  ["<leader>fs"] = {"<cmd>Telescope live_grep<cr>", "Find string in pwd"},
  ["<leader>fc"] = {"<cmd>Telescope grep_string<cr>", "Find string in current cursor position"},
  ["<leader>fb"] = {"<cmd>Telescope buffers<cr>", "List current buffers"},
  ["<leader>fh"] = {"<cmd>Telescope help_tags<cr>", "List help tags"},


  ["<S-l>"] = {"<cmd>BufferLineCycleNext<CR>", "Cycle right buffer"},
  ["<S-h>"] = {"<cmd>BufferLineCyclePrev<CR>", "Cycle left buffer"},

  ["<leader>L"] = {"<cmd>Lazy<CR>", "Open Lazy.nvim"},

  ['<leader>l'] = {name = '+LSP'},
  ['<leader>lm'] = {'<cmd>Mason<CR>', 'Mason Info'},
  ["<leader>lr"] = {"<cmd>LspRestart", "Restart LSP server"},


  ['<leader>;'] = {'<cmd>Alpha<CR>', 'Dashboard'},

  ["<leader>r"] = {"<cmd>%s/", "Search & replace"},
}, n)

wk.register({
  ["jj"] = {"<ESC>", "Enter normal mode"},
  ["<C-s>"] = {"<ESC><cmd>w<CR>", "Save file"},
}, i)
