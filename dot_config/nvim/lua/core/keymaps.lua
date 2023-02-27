vim.g.mapleader = " "

local wk = require("which-key")

local n = {mode = "n"}
local i = {mode = "i"}
local v = {mode = "v"}

wk.register({
  ["<leader>="] = {"<C-a>", "Increment number"},
  ["<leader>-"] = {"<C-x>", "Decrement number"},

  ["<leader>h"] = {":nohl<CR>", "Clear highlights"},

  ["<leader>s"] = {name = "Window management"},
  ["<leader>sv"] = {"<C-w>v", "Split vertically"},
  ["<leader>sh"] = {"<C-w>v", "Split horizontally"},
  ["<leader>se"] = {"<C-w>v", "Equalize windows"},
  ["<leader>sw"] = {":close<CR>", "Close window"},
  ["<leader>sm"] = {":MaximizerToggle<CR>", "Maximize window"},
  
  ["<leader>c"] = {":BufDel<CR>", "Close buffer"},

  ["<C-s>"] = {":w<CR>", "Save file"},

  ["<leader>e"] = {":NvimTreeToggle<CR>", "Toggle file explorer"},

  ["<leader>f"] = {name = "+File"},
  ["<leader>ff"] = {"<cmd>Telescope find_files<cr>", "Find files in pwd"},
  ["<leader>fs"] = {"<cmd>Telescope live_grep<cr>", "Find string in pwd"},
  ["<leader>fc"] = {"<cmd>Telescope grep_string<cr>", "Find string in current cursor position"},
  ["<leader>fb"] = {"<cmd>Telescope buffers<cr>", "List current buffers"},
  ["<leader>fh"] = {"<cmd>Telescope help_tags<cr>", "List help tags"},

  ["<leader>l"] = {name = "+LSP"},
  ["<leader>lr"] = {":LspRestart", "Restart LSP server"},

  ["<S-l>"] = {":BufferLineCycleNext<CR>", "Cycle right buffer"},
  ["<S-h>"] = {":BufferLineCyclePrev<CR>", "Cycle left buffer"},

  ["<leader>L"] = {":Lazy<CR>", "Open Lazy.nvim"},
}, n)

wk.register({
  ["jj"] = {"<ESC>", "Enter normal mode"},
  ["<C-s>"] = {"<ESC>:w<CR>", "Save file"},
}, i)
