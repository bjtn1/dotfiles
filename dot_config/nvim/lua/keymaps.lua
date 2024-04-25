local wk = require("which-key")

local i = { mode = "i" }
local n = { mode = "n" }
local v = { mode = "v" }
local t = { mode = "t" }
local x = { mode = "x" }

-- Normal mode keymaps
-- in WhichKey, noremap and silent options are true by default
wk.register({
  ["<leader>1"] = { '<cmd> lua require("bufferline").go_to(1, true)<cr>', "Go to buffer 1" },
  ["<leader>2"] = { '<cmd> lua require("bufferline").go_to(2, true)<cr>', "Go to buffer 2" },
  ["<leader>3"] = { '<cmd> lua require("bufferline").go_to(3, true)<cr>', "Go to buffer 3" },
  ["<leader>4"] = { '<cmd> lua require("bufferline").go_to(4, true)<cr>', "Go to buffer 4" },
  ["<leader>5"] = { '<cmd> lua require("bufferline").go_to(5, true)<cr>', "Go to buffer 5" },
  ["<leader>6"] = { '<cmd> lua require("bufferline").go_to(6, true)<cr>', "Go to buffer 6" },
  ["<leader>7"] = { '<cmd> lua require("bufferline").go_to(7, true)<cr>', "Go to buffer 7" },
  ["<leader>8"] = { '<cmd> lua require("bufferline").go_to(8, true)<cr>', "Go to buffer 8" },
  ["<leader>9"] = { '<cmd> lua require("bufferline").go_to(9, true)<cr>', "Go to buffer 9" },
  ["<leader>0"] = { '<cmd> lua require("bufferline").go_to(-1, true)<cr>', "Go to last buffer" },

  ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },
  ["J"] = { "<Cmd>m .+1<CR>==", "Move line at cursor down" },
  ["K"] = { "<Cmd>m .-2<CR>==", "Move line at cursor up" },
  ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
  ["y"] = { '"+y', "Yank to system clipboard" },
  ["Y"] = { '"+y$', "Yank to system clipboard (to end of line)" },
  ["p"] = { '"+p', "Put from system clipboard" },
  ["P"] = { '"+P', "Put from system clipboard (before cursor)" },
  ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
  ["<leader>c"] = { "<cmd>lua MiniBufremove.delete()<cr>", "Close buffer" },
  ["<leader>e"] = { "<cmd>Neotree toggle reveal_force_cwd<cr>", "File explorer" },
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

  ["<leader>ss"] = { "<cmd>Silicon<cr>", "Screenshot file" },

  ["<leader>b"] = {
    name = "+Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
    L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
  },

  ["<leader>d"] = {
    name = "+Diagnostics",
    a = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Diagnostics from workspace" },
    c = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics from current buffer" },
    t = { "<cmd>echo 'LOL THIS DONT WORK YET, ILL FIGURE IT OUT LATER'<cr>", "View TODOs in current directory" },
  },

  ["<leader>g"] = {
    name = "+Git",
    g = { "<cmd>lua _Lazygit_toggle()<CR>", "LazyGit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
  },

  ["<leader>l"] = {
    name = "+LSP",
    -- Available keybinds
    -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    -- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    -- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    -- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    -- vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    -- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    -- vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    -- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    -- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    m = { "<cmd>Mason<cr>", "Mason Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },

  ["<ledaer>o"] = {
    name = "+Obsidian",
    o = { "<cmd>ObsidianOpen<cr>", "Open current note" },
  },

  ["<leader>p"] = {
    name = "+Plugin",
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    S = { "<cmd>Lazy clear<cr>", "Status" },
    c = { "<cmd>Lazy clean<cr>", "Clean" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    p = { "<cmd>Lazy profile<cr>", "Profile" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    d = { "<cmd>Lazy debug<cr>", "Debug" },
    h = { "<cmd>Lazy home<cr>", "Home" },
  },

  ["<leader>R"] = {
    name = "+Restore",
    c = { '<cmd>lua require("persistence").load()<cr>', "Current directory's last session" },
    l = { '<cmd>lua require("persistence").load({last = true})<cr>', "Last session" },
  },

  ["<leader>s"] = {
    name = "+Search",
    ar = { ":%s/", "Search and replace" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>TodoTelescope<cr>", "Find TODOs" },
    T = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },

  ["<leader>v"] = {
    name = "+VimTex",
    i = { "<cmd>VimtexInfo<cr>", "VimTex Info" },
    c = { "<cmd>VimtexCompile<cr>", "VimTex Compile and Cleanup" },
    a = { "<cmd>VimtexView<cr>", "Trigger forward search" },
    s = { "<cmd>VimtexStop<cr><cmd>VimtexClean<cr>", "Stop compiler and clean up aux files" },
    C = { "<cmd>VimtexClean<cr>", "Clean aux files" },
    r = {
      "<cmd>lua require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})<cr>",
      "Reload snippets",
    },
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
  ["K"] = { ":m '<-2<cr>gv=gv", "move visual block selection up" },
  ["J"] = { ":m '>+1<cr>gv=gv", "move line at cursor down" },
}, x)

-- Visual mode keymaps
wk.register({
  ["y"] = { '"+y', "Yank to system clipboard" },
  ["Y"] = { '"+y$', "Yank to system clipboard (to end of line)" },
  ["p"] = { '"+p', "Put from system clipboard" },
  ["P"] = { '"+P', "Put from system clipboard (before cursor)" },
  ["x"] = { '"+x', "Yank and delete to system clipboard" },
  ["<leader>s"] = {
    name = "+Screenshot",
    c = { ":Silicon<cr>", "Code" },
    f = { "<cmd>Silicon<cr>", "File" },
  },
}, v)
