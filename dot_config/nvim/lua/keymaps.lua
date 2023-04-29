local wk = require("which-key")
local vk = vim.keymap

local i = { mode = "i" }
local n = { mode = "n" }
local v = { mode = "v" }
local t = { mode = "t" }

vk.set("n", "K", "<cmd>m .-2<CR>==")
vk.set("n", "J", "<cmd>m .+1<CR>==")

vk.set("v", "K", "<cmd>m '<-2<CR>gv=gv")
vk.set("v", "J", "<cmd>m '>+1<CR>gv=gv")

vk.set("n", "<C-u>", "<C-u>zz")
vk.set("n", "<C-d>", "<C-d>zz")

wk.register({
  -------------------
  -- Single mappings
  -------------------
  ["<leader>pm"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview markdown" },
  ["<leader>Cg"] = { "<cmd>CreateGistFromFile<cr>", "Create gist" },
  ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
  ["<leader>e"] = { "<cmd>NeoTreeFloatToggle<cr>", "Toggle NeoTree" },
  ["<leader>;"] = { "<cmd>Alpha<cr>", "Toggle dashboard" },
  ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
  ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },
  ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  ["<leader>h"] = { "<cmd>noh<cr>", "Clear highlights" },
  ["<leader>c"] = { "<Plug>(comment_toggle_linewise)", "Toggle comment<motion>" },
  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle comment line" },
  ["<leader>G"] = { "<cmd>lua _Lazygit_toggle()<CR>", "Open lazygit" },
  ["<leader>gdc"] = { "<cmd>Neogen<cr>", "Generate doc comment" },
  ["<C-c>"] = { "<cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_cycle<cr>", "Cycle Neorg todo items" },
  ["<leader>j"] = { " <esc><cmd>m .+1<cr>=", "Move line down" },
  ["<leader>k"] = { " <esc><cmd>m .-2<cr>==", "Move line up" },
  ["<leader>z"] = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },

  --------------------
  -- Menu Mappings
  --------------------
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
  ["<leader>l"] = {
    name = "+LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code actions" },
    s = { "<cmd>LspInfo<cr>", "Show attached servers" },
    f = { "<cmd>NullLsInfo<cr>", "Show attached formatters & linters" },
    d = { "<cmd>Lspsaga lsp_finder<cr>", "View definition and references" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename at cursor" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition (editable)" },
    k = { "<cmd>Lspsaga hover_doc ++keep<cr>", "Show documentation" },
  },
  ["<leader>n"] = {
    name = "+Neorg",
    e = { "<cmd>Neorg export to-file<cr>", "Export current .norg to .md" },
    i = { "<cmd>Neorg inject-metadata<cr>", "Inject metadata" },
    t = { "<cmd>e ~/todo.norg<cr>", "See todo.norg" },
    u = { "<cmd>Neorg update-metadata<cr>", "Update metadata" },
  },
  ["<leader>o"] = {
    name = "+Open",
    g = { "<cmd>lua _Lazygit_toggle()<CR>", "LazyGit" },
    l = { "<cmd>Lazy<cr>", "Lazy (plugin manager)" },
    m = { "<cmd>Mason<cr>", "Mason" },
  },
  ["<leader>r"] = {
    name = "+Restore",
    c = { '<cmd>lua require("persistence").load()<cr>', "Current directory's last session" },
    l = { '<cmd>lua require("persistence").load({last = true})<cr>', "Last session" },
  },
  ["<leader>s"] = {
    name = "+Search",
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    s = { "<cmd>Telescope live_grep<cr>", "String (all files)" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
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

wk.register({
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
}, i)

wk.register({
  ["<C-Bslash>"] = { "<cmd>wincmd h<cr>", "" },
}, t)
