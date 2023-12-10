local wk = require("which-key")

local i = { mode = "i" }
local n = { mode = "n" }
local v = { mode = "v" }
local t = { mode = "t" }
local x = { mode = "x" }

-- Normal mode keymaps
-- in WhichKey, noremap and silent options are true by default
wk.register({
  ["y"] = { '"+y', "Yank to system clipboard" },
  ["Y"] = { '"+y$', "Yank to system clipboard (to end of line)" },
  ["p"] = { '"+p', "Put from system clipboard" },
  ["P"] = { '"+P', "Put from system clipboard (before cursor)" },
  ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },
  ["J"] = { "<Cmd>m .+1<CR>==", "Move line at cursor down" },
  ["K"] = { "<Cmd>m .-2<CR>==", "Move line at cursor up" },
  ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
  ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NeoTree" },
  ["<leader>pm"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview markdown" },
  ["<leader>;"] = { "<cmd>Alpha<cr>", "Toggle dashboard" },
  ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  ["<leader>h"] = { "<cmd>noh<cr>", "Clear highlights" },

  ["s"] = {
    name = "+Surround",
    a = { "<Plug>Ysurround", "Add<motion><delimiter>" },
    d = { "<Plug>Dsurround", "Delete<delimiter>" },
    c = { "<Plug>Csurround", "Change<old_delimiter><new_delimiter>" },
    A = { "<Plug>Yssurround", "Add in line" },
  },
  ["<leader>b"] = {
    name = "+Buffer",
    c = { "<cmd>lua MiniBufremove.delete()<cr>", "Buffer close" },
  },
  ["<leader>d"] = {
    name = "+Diagnostics",
    a = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Diagnostics from workspace" },
    c = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics from current buffer" },
    t = { "<cmd>echo 'LOL THIS DONT WORK YET, ILL FIGURE IT OUT LATER'<cr>", "View TODOs in current directory" },
  },
  ["<leader>o"] = {
    name = "+Open",
    g = { "<cmd>lua _Lazygit_toggle()<CR>", "LazyGit" },
    l = { "<cmd>Lazy<cr>", "Lazy (plugin manager)" },
    m = { "<cmd>Mason<cr>", "Mason" },
    w = {"<cmd>WhichKey<cr>", "WhichKey"},
  },
  ["<leader>R"] = {
    name = "+Restore",
    c = { '<cmd>lua require("persistence").load()<cr>', "Current directory's last session" },
    l = { '<cmd>lua require("persistence").load({last = true})<cr>', "Last session" },
  },
  ["<leader>s"] = {
    name = "+Search",
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    R = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    s = { "<cmd>Telescope live_grep<cr>", "String (all files)" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    r = { ":%s/", "Searh and replace"},
  },
  ["<leader>v"] = {
    name = "+VimTex",
    i = {"<cmd>VimtexInfo<cr>", "VimTex Info"},
    c = {"<cmd>VimtexCompile<cr>", "VimTex Compile and Cleanup"},
    a = {"<cmd>VimtexView<cr>", "Trigger forward search"},
    s = {"<cmd>VimtexStop<cr><cmd>VimtexClean<cr>", "Stop compiler and clean up aux files"},
    C = {"<cmd>VimtexClean<cr>", "Clean aux files"},
    r = {"<cmd>lua require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})<cr>", "Reload snippets"},
  },
  ["<leader>w"] = {
    name = "+Window",
    v = { "<C-w>v", "Split vertically" },
    h = { "<C-w>s", "Split horizontally" },
    e = { "<C-w>=", "Equalize" },
    c = { "<cmd>close<cr>", "Close" },
    m = { "<cmd>MaximizerToggle<cr>", "Maximize window" },
  },
}, n)

-- Insert mode keymaps
wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
}, i)

-- Terminal mode keymaps
wk.register({
  ["<C-Bslash>"] = { "<cmd>wincmd h<cr>", "" },
}, t)

-- Visual block mode keymaps
wk.register({
  -- Use K and J in normal mode to move line at cursor up or down respectively
  ["K"] = { ":m '<-2<CR>gv=gv", "Move visual block selection up" },
  ["J"] = { ":m '>+1<CR>gv=gv", "Move line at cursor down" },
}, x)

-- Visual mode keymaps
wk.register({
  ["y"] = { '"+y', "Yank to system clipboard" },
  ["Y"] = { '"+y$', "Yank to system clipboard (to end of line)" },
  ["p"] = { '"+p', "Put from system clipboard" },
  ["P"] = { '"+P', "Put from system clipboard (before cursor)" },
}, v)
