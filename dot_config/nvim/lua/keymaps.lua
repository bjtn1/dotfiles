local wk = require("which-key")

local i = { mode = "i" }
local n = { mode = "n" }
-- local v = {mode = "v"}

wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
  ["<leader>l"] = { "<cmd>Lazy<cr>", "Open Lazy" },
  ["<leader>e"] = { "<cmd>NeoTreeFloatToggle<cr>", "Toggle NeoTree" },
  ["<leader>;"] = { "<cmd>Alpha<cr>", "Dashboard" },
  ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
  ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },
  ["<leader>b"] = {
    name = "+Buffer",
    d = { "<cmd>lua MiniBufremove.delete()<cr>", "Buffer delete" },
  },
  ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  -- note do `:help Telescope.builtin` for more telescope commands
  ["<leader>t"] = {
    name = "+Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    n = { "<cmd>enew<cr>", "New File" },
    s = { "<cmd>Telescope live_grep<cr>", "Find string (all files)" },
    c = { "<cmd>Telescope colorscheme<cr>", "Preview colorschemes" },
    p = { "<cmd>Telescope projects<cr>", "View projects" },
  },
  ["<leader>d"] = {
    name = "+Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Show workspace diagnostics" },
    s = { "<cmd>TroubleToggle document_diagnostics<cr>", "Show document diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Show loclist" },
  },
  ["<leader>r"] = {
    name = "+Restore",
    c = { "<cmd>lua require(\"persistence\").load()<cr>", "Current directory's last session" },
    l = { "<cmd>lua require(\"persistence\").load({last = true})<cr>", "Last session" },
  },
  ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  ["<leader>h"] = { "<cmd>noh<cr>", "Clear highlights" },
}, n)


wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
}, i)

