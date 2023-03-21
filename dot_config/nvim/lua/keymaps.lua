local wk = require("which-key")

local i = { mode = "i" }
local n = { mode = "n" }
-- local v = {mode = "v"}
local t = { mode = "t" }

wk.register({
  -------------------
  -- Single mappings
  -------------------
  ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
  ["<leader>p"] = { "<cmd>Lazy<cr>", "Open plugin manager" },
  ["<leader>e"] = { "<cmd>NeoTreeFloatToggle<cr>", "Toggle NeoTree" },
  ["<leader>;"] = { "<cmd>Alpha<cr>", "Toggle dashboard" },
  ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
  ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },
  ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  ["<leader>h"] = { "<cmd>noh<cr>", "Clear highlights" },
  ["<leader>c"] = { "<Plug>(comment_toggle_linewise)", "Toggle comment<motion>" },
  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle comment line" },
  ["<leader>g"] = { "<cmd>lua _Lazygit_toggle()<CR>", "Toggle lazygit" },
  --------------------
  -- Menu Mappings
  --------------------
  ["<leader>b"] = {
    name = "+Buffer",
    c = { "<cmd>lua MiniBufremove.delete()<cr>", "Buffer close" },
  },
  -- NOTE
  -- do `:help Telescope.builtin` for more telescope commands
  ["<leader>s"] = {
    name = "+Search",
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    s = { "<cmd>Telescope live_grep<cr>", "String (all files)" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
  },
  ["<leader>d"] = {
    name = "+Diagnostics",
    a = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Diagnostics from workspace" },
    c = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics from current buffer" },
    t = { "<cmd>echo 'LOL THIS DONT WORK YET, ILL FIGURE IT OUT LATER'<cr>", "View TODOs in current directory" },
  },
  ["<leader>r"] = {
    name = "+Restore",
    c = { '<cmd>lua require("persistence").load()<cr>', "Current directory's last session" },
    l = { '<cmd>lua require("persistence").load({last = true})<cr>', "Last session" },
  },
  ["<leader>w"] = {
    name = "+Window",
    v = { "<C-w>v", "Split vertically" },
    h = { "<C-w>s", "Split horizontally" },
    e = { "<C-w>=", "Equalize" },
    c = { "<cmd>close<cr>", "Close" },
    m = { "<cmd>MaximizerToggle<cr>", "Maximize window" },
  },
  ["<leader>l"] = {
    name = "+LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code actions" },
    s = { "<cmd>LspInfo<cr>", "Show attached servers" },
    f = { "<cmd>NullLsInfo<cr>", "Show attached formatters & linters" },
    m = { "<cmd>Mason<cr>", "Open Mason" },
    d = { "<cmd>Lspsaga lsp_finder<cr>", "View definition and references" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename at cursor" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition (editable)" },
    k = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Show documentation" },
  },
}, n)

wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
}, i)

wk.register({
  ["<C-Bslash>"] = { "<cmd>wincmd h<cr>", "" },
  -- ["<esc>"] = { "<C-\\><C-n>", "" },
}, t)
