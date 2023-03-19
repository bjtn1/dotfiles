local wk = require("which-key")

local i = { mode = "i" }
local n = { mode = "n" }
-- local v = {mode = "v"}
local t = { mode = "t" }

wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },

  ["<leader>l"] = { "<cmd>Lazy<cr>", "Open Lazy" },
  ["<leader>e"] = { "<cmd>NeoTreeFloatToggle<cr>", "Toggle NeoTree" },
  ["<leader>;"] = { "<cmd>Alpha<cr>", "Toggle dashboard" },

  ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
  ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },

  ["<leader>b"] = {
    name = "+Buffer",
    c = { "<cmd>lua MiniBufremove.delete()<cr>", "Buffer close" },
  },

  ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },

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

  ["<leader>c"] = { "<Plug>(comment_toggle_linewise)", "Toggle comment" },

  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle comment line" },


  ["<leader>w"] = {
    name = "+Window",
    v = { "<C-w>v", "Split vertically" },
    h = { "<C-w>s", "Split horizontally" },
    e = { "<C-w>=", "Equalize" },
    c = { "<cmd>close<cr>", "Close" },
    m = { "<cmd>MaximizerToggle<cr>", "Maximize window" },
  },

  ["<leader>g"] = { "<cmd>lua _Lazygit_toggle()<CR>", "Toggle lazygit" },

  ["<leader>L"] = {
    name = "+LSP",
    s = { "<cmd>LspInfo<cr>", "Show attached servers" },
    f = { "<cmd>NullLsInfo<cr>", "Show attached formatters & linters" },

  }

}, n)



wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
}, i)

wk.register({
  ["<C-Bslash>"] = { "<cmd>wincmd h<cr>" , "" },
  ["<esc>"] = { "<C-\\><C-n>", "" },

}, t)
