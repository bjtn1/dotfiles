-- checkhealth which-key report
-- checking for overlapping keymaps ~
-- - WARNING In mode `n`, <y> overlaps with <yS>, <ySS>, <ySs>, <ys>, <yss>:
--   - <y>: Yank to system clipboard
-- - WARNING In mode `n`, <gb> overlaps with <gbc>:
--   - <gb>: Comment toggle blockwise
--   - <gbc>: Comment toggle current block
-- - WARNING In mode `n`, <gc> overlaps with <gcO>, <gco>, <gcc>, <gcA>:
--   - <gc>: Comment toggle linewise
--   - <gcO>: Comment insert above
--   - <gco>: Comment insert below
--   - <gcc>: Comment toggle current line
--   - <gcA>: Comment insert end of line
-- - WARNING In mode `n`, <ys> overlaps with <yss>:
--   
-- - WARNING In mode `n`, <yS> overlaps with <ySS>, <ySs>:
--   
-- - OK Overlapping keymaps are only reported for informational purposes.
--   This doesn't necessarily mean there is a problem with your config.
--
-- Checking for duplicate mappings ~
-- - OK No duplicate mappings found

local wk = require("which-key")

wk.add({
  -- Normal mode keymaps
  {
    mode = { "n" },
    { "<C-Bslash>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

    -- Use Ctrl + Forward slash to comment the current line
    { "<C-_>", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },

    { "<C-s>", "<esc><cmd>w<cr>", desc = "Save file" },

    -- { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },
    { "<leader>0", '<cmd> lua require("bufferline").go_to(-1, true)<cr>', desc = "Go to last buffer" },
    { "<leader>1", '<cmd> lua require("bufferline").go_to(1, true)<cr>', desc = "Go to buffer 1" },
    { "<leader>2", '<cmd> lua require("bufferline").go_to(2, true)<cr>', desc = "Go to buffer 2" },
    { "<leader>3", '<cmd> lua require("bufferline").go_to(3, true)<cr>', desc = "Go to buffer 3" },
    { "<leader>4", '<cmd> lua require("bufferline").go_to(4, true)<cr>', desc = "Go to buffer 4" },
    { "<leader>5", '<cmd> lua require("bufferline").go_to(5, true)<cr>', desc = "Go to buffer 5" },
    { "<leader>6", '<cmd> lua require("bufferline").go_to(6, true)<cr>', desc = "Go to buffer 6" },
    { "<leader>7", '<cmd> lua require("bufferline").go_to(7, true)<cr>', desc = "Go to buffer 7" },
    { "<leader>8", '<cmd> lua require("bufferline").go_to(8, true)<cr>', desc = "Go to buffer 8" },
    { "<leader>9", '<cmd> lua require("bufferline").go_to(9, true)<cr>', desc = "Go to buffer 9" },

    { "<leader>;", "<cmd>Alpha<cr>", desc = "Toggle dashboard" },

    { "<leader>N", group = "Neorg" },
    { "<leader>Ne", "<cmd>Neorg export to-file<cr>", desc = "Export current .norg to .md" },
    { "<leader>Ni", "<cmd>Neorg inject-metadata<cr>", desc = "Inject metadata" },
    { "<leader>Nt", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
    { "<leader>Nu", "<cmd>Neorg update-metadata<cr>", desc = "Update metadata" },

    { "<leader>R", group = "Restore" },
    { "<leader>Rc", '<cmd>lua require("persistence").load()<cr>', desc = "Current directory's last session" },
    { "<leader>Rl", '<cmd>lua require("persistence").load({last = true})<cr>', desc = "Last session" },

    { "<leader>b", group = "Buffers" },
    { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
    { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },
    { "<leader>bW", "<cmd>noautocmd w<cr>", desc = "Save without formatting (noautocmd)" },
    { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
    { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
    { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
    { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
    { "<leader>c", "<cmd>lua MiniBufremove.delete()<cr>", desc = "Close buffer" },

    { "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<cr>", desc = "File explorer" },

    { "<leader>g", group = "Git" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
    { "<leader>gg", "<cmd>lua _Lazygit_toggle()<CR>", desc = "LazyGit" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },

    { "<leader>h", "<cmd>noh<cr>", desc = "Clear highlights" },

    { "<leader>l", group = "LSP" },
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
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
    { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>", desc = "Format" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason Info" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },

    { "<leader>n", group = "Notifications" },
    { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismisss all visible messages" },
    { "<leader>ne", "<cmd>Noice errors<cr>", desc = "View error messages" },
    { "<leader>nh", "<cmd>Noice telescope<cr>", desc = "View message history" },
    { "<leader>nl", "<cmd>Noice last<cr>", desc = "View last message" },

    { "<leader>o", group = "Obsidian" },
    { "<leader>ob", "<cmd>ObsidianQuickSwitch<cr>", desc = "Browse notes in telescope" },
    { "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle checkbox" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Create daily note" },
    { "<leader>on", group = "New note" },
    { "<leader>onc", "<cmd>ObsidianNew<cr>02-scripts/", desc = "New script note" },
    { "<leader>ond", "<cmd>ObsidianNew<cr>05-dailies/", desc = "New daily note" },
    { "<leader>oni", "<cmd>ObsidianNew<cr>04-disposable/", desc = "New disposable note" },
    { "<leader>onp", "<cmd>ObsidianNew<cr>01-personal/", desc = "New personal note" },
    { "<leader>ons", "<cmd>ObsidianNew<cr>00-school/", desc = "New school note" },
    { "<leader>ont", "<cmd>ObsidianNew<cr>03-todo/", desc = "New todo note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open current note" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image in clipboard at cursor" },
    { "<leader>or", ":ObsidianRename ", desc = "Rename current note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search all notes in vault" },
    { "<leader>ot", "/#<cr>ggnO<esc>O<esc><cmd>TOCList<cr><cmd>noh<cr>", desc = "Generate table of contents" },
    { "<leader>ov", "<cmd>cd /Users/bjtn/Library/Mobile Documents/iCloud~md~obsidian/Documents/bjtn01/<cr><cmd>pwd<cr>", desc = "cd to vault" },

    { "<leader>p", group = "Plugin" },
    { "<leader>pS", "<cmd>Lazy clear<cr>", desc = "Status" },
    { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean" },
    { "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug" },
    { "<leader>ph", "<cmd>Lazy home<cr>", desc = "Home" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
    { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log" },
    { "<leader>pm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Preview markdown" },
    { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },
    { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },

    { "<leader>s", group = "Search" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sT", "<cmd>Telescope live_grep<cr>", desc = "Text" },
    { "<leader>sar", ":%s/", desc = "Search and replace" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
    { "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>ss", "<cmd>Silicon<cr>", desc = "Screenshot file" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },

    { "<leader>v", group = "VimTex" },
    { "<leader>vC", "<cmd>VimtexClean<cr>", desc = "Clean aux files" },
    { "<leader>va", "<cmd>VimtexView<cr>", desc = "Trigger forward search" },
    { "<leader>vc", "<cmd>VimtexCompile<cr>", desc = "VimTex Compile and Cleanup" },
    { "<leader>vi", "<cmd>VimtexInfo<cr>", desc = "VimTex Info" },
    { "<leader>vr", "<cmd>lua require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})<cr>", desc = "Reload snippets" },
    { "<leader>vs", "<cmd>VimtexStop<cr><cmd>VimtexClean<cr>", desc = "Stop compiler and clean up aux files" },

    { "<leader>w", group = "Window" },
    { "<leader>wc", "<cmd>close<cr>", desc = "Close" },
    { "<leader>we", "<C-w>=", desc = "Equalize" },
    { "<leader>wh", "<C-w>s", desc = "Split horizontally" },
    { "<leader>wm", "<cmd>MaximizerToggle<cr>", desc = "Maximize window" },
    { "<leader>wv", "<C-w>v", desc = "Split vertically" },

    { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Cycle to prev tab" },

    { "J", "<Cmd>m .+1<CR>==", desc = "Move line at cursor down" },

    { "K", "<Cmd>m .-2<CR>==", desc = "Move line at cursor up" },

    { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Cycle to next tab" },

    { "P", '"+P', desc = "Put from system clipboard (before cursor)" },

    { "Y", '"+y$', desc = "Yank to system clipboard (to end of line)" },

    { "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP references" },

    { "p", '"+p', desc = "Put from system clipboard" },

    { "s", group = "Surround" },
    { "sA", "<Plug>Yssurround", desc = "Add in line" },
    { "sa", "<Plug>Ysurround", desc = "Add<motion><delimiter>" },
    { "sc", "<Plug>Csurround", desc = "Change<old_delimiter><new_delimiter>" },
    { "sd", "<Plug>Dsurround", desc = "Delete<delimiter>" },

    { "y", '"+y', desc = "Yank to system clipboard" },
  },

  -- Visual mode keymaps
  {
    mode = { "v" },
    { "<C-_>", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)" },

    { "<C-s>", "<esc><cmd>w<cr>", desc = "Save file" },

    -- { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)" },

    { "<leader>s", group = "Screenshot" },
    { "<leader>sc", ":Silicon<cr>", desc = "Code" },
    { "<leader>sf", "<cmd>Silicon<cr>", desc = "File" },

    { "P", '"+P', desc = "Put from system clipboard (before cursor)" },

    { "Y", '"+y$', desc = "Yank to system clipboard (to end of line)" },

    { "p", '"+p', desc = "Put from system clipboard" },

    { "x", '"+x', desc = "Yank and delete to system clipboard" },

    { "y", '"+y', desc = "Yank to system clipboard" },
  },

  -- Visual block mode keymaps
  {
    mode = { "x" },
    { "J", ":m '>+1<cr>gv=gv", desc = "move line at cursor down", mode = "x" },
    { "K", ":m '<-2<cr>gv=gv", desc = "move visual block selection up", mode = "x" },

    { "<C-s>", "<esc><cmd>w<cr>", desc = "Save file" },
  },

  -- Terminal mode keymaps
  {
    mode = { "t" },
    { "<C-Bslash>", "<cmd>wincmd h<cr>", desc = "", mode = "t" }
  },

  -- Insert mode keymaps
  {
    mode = { "i" },
    { "<C-s>", "<esc><cmd>w<cr>", desc = "Save file", mode = "i" }
  }
})

-- local i = { mode = "i" }
-- local n = { mode = "n" }
-- local v = { mode = "v" }
-- local t = { mode = "t" }
-- local x = { mode = "x" }
--
--
-- -- Normal mode keymaps
-- -- in WhichKey, noremap and silent options are true by default
-- wk.register({
--   -- Use Ctrl + Forward slash to comment the current line
--   ["<C-_>"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
--   ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
--
--   ["<leader>1"] = { '<cmd> lua require("bufferline").go_to(1, true)<cr>', "Go to buffer 1" },
--   ["<leader>2"] = { '<cmd> lua require("bufferline").go_to(2, true)<cr>', "Go to buffer 2" },
--   ["<leader>3"] = { '<cmd> lua require("bufferline").go_to(3, true)<cr>', "Go to buffer 3" },
--   ["<leader>4"] = { '<cmd> lua require("bufferline").go_to(4, true)<cr>', "Go to buffer 4" },
--   ["<leader>5"] = { '<cmd> lua require("bufferline").go_to(5, true)<cr>', "Go to buffer 5" },
--   ["<leader>6"] = { '<cmd> lua require("bufferline").go_to(6, true)<cr>', "Go to buffer 6" },
--   ["<leader>7"] = { '<cmd> lua require("bufferline").go_to(7, true)<cr>', "Go to buffer 7" },
--   ["<leader>8"] = { '<cmd> lua require("bufferline").go_to(8, true)<cr>', "Go to buffer 8" },
--   ["<leader>9"] = { '<cmd> lua require("bufferline").go_to(9, true)<cr>', "Go to buffer 9" },
--   ["<leader>0"] = { '<cmd> lua require("bufferline").go_to(-1, true)<cr>', "Go to last buffer" },
--
--   ["H"] = { "<cmd>BufferLineCyclePrev<cr>", "Cycle to prev tab" },
--   ["J"] = { "<Cmd>m .+1<CR>==", "Move line at cursor down" },
--   ["K"] = { "<Cmd>m .-2<CR>==", "Move line at cursor up" },
--   ["L"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle to next tab" },
--   ["y"] = { '"+y', "Yank to system clipboard" },
--   ["Y"] = { '"+y$', "Yank to system clipboard (to end of line)" },
--   ["p"] = { '"+p', "Put from system clipboard" },
--   ["P"] = { '"+P', "Put from system clipboard (before cursor)" },
--
--   ["<C-Bslash>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
--   ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
--
--   ["<leader>c"] = { "<cmd>lua MiniBufremove.delete()<cr>", "Close buffer" },
--   ["<leader>e"] = { "<cmd>Neotree toggle reveal_force_cwd<cr>", "File explorer" },
--   ["<leader>pm"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview markdown" },
--   ["<leader>;"] = { "<cmd>Alpha<cr>", "Toggle dashboard" },
--
--   ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
--
--   ["<leader>h"] = { "<cmd>noh<cr>", "Clear highlights" },
--
--   ["s"] = {
--     name = "+Surround",
--     a = { "<Plug>Ysurround", "Add<motion><delimiter>" },
--     d = { "<Plug>Dsurround", "Delete<delimiter>" },
--     c = { "<Plug>Csurround", "Change<old_delimiter><new_delimiter>" },
--     A = { "<Plug>Yssurround", "Add in line" },
--   },
--
--   ["<leader>ss"] = { "<cmd>Silicon<cr>", "Screenshot file" },
--
--   ["<leader>b"] = {
--     name = "+Buffers",
--     j = { "<cmd>BufferLinePick<cr>", "Jump" },
--     f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
--     b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
--     n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
--     W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
--     e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
--     h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
--     l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
--     D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
--     L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
--   },
--
--   ["<leader>g"] = {
--     name = "+Git",
--     g = { "<cmd>lua _Lazygit_toggle()<CR>", "LazyGit" },
--     j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
--     k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
--     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--     u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
--     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--     C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
--     d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
--   },
--
--   ["<leader>l"] = {
--     name = "+LSP",
--     -- Available keybinds
--     -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
--     -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
--     -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
--     -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
--     -- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
--     -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
--     -- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
--     -- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
--     -- vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
--     -- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--     -- vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
--     -- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
--     -- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
--     a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
--     w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
--     f = { "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>", "Format" },
--     i = { "<cmd>LspInfo<cr>", "Info" },
--     m = { "<cmd>Mason<cr>", "Mason Info" },
--     j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
--     k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
--     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--     q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
--     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--     S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
--     e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
--   },
--
--   ["<leader>n"] = {
--     name = "+Notifications",
--     e = { "<cmd>Noice errors<cr>", "View error messages" },
--     l = { "<cmd>Noice last<cr>", "View last message" },
--     h = { "<cmd>Noice telescope<cr>", "View message history" },
--     d = { "<cmd>Noice dismiss<cr>", "Dismisss all visible messages" },
--   },
--
--   ["<leader>N"] = {
--     name = "+Neorg",
--     e = { "<cmd>Neorg export to-file<cr>", "Export current .norg to .md" },
--     i = { "<cmd>Neorg inject-metadata<cr>", "Inject metadata" },
--     t = { "<cmd>Neorg toggle-concealer<cr>", "Toggle concealer" },
--     u = { "<cmd>Neorg update-metadata<cr>", "Update metadata" },
--   },
--
--   ["<leader>o"] = {
--     name = "+Obsidian",
--     o = { "<cmd>ObsidianOpen<cr>", "Open current note" },
--     t = { "/#<cr>ggnO<esc>O<esc><cmd>TOCList<cr><cmd>noh<cr>", "Generate table of contents" },
--     n = {
--       name = "+New note",
--       s = { "<cmd>ObsidianNew<cr>00-school/", "New school note" },
--       p = { "<cmd>ObsidianNew<cr>01-personal/", "New personal note" },
--       c = { "<cmd>ObsidianNew<cr>02-scripts/", "New script note" },
--       t = { "<cmd>ObsidianNew<cr>03-todo/", "New todo note" },
--       i = { "<cmd>ObsidianNew<cr>04-disposable/", "New disposable note" },
--       d = { "<cmd>ObsidianNew<cr>05-dailies/", "New daily note" },
--     },
--     b = { "<cmd>ObsidianQuickSwitch<cr>", "Browse notes in telescope" },
--     d = { "<cmd>ObsidianToday<cr>", "Create daily note" },
--     s = { "<cmd>ObsidianSearch<cr>", "Search all notes in vault" },
--     p = { "<cmd>ObsidianPasteImg<cr>", "Paste image in clipboard at cursor" },
--     r = { ":ObsidianRename ", "Rename current note" },
--     c = { "<cmd>ObsidianToggleCheckbox<cr>", "Toggle checkbox" },
--     v = { "<cmd>cd /Users/bjtn/Library/Mobile Documents/iCloud~md~obsidian/Documents/bjtn01/<cr><cmd>pwd<cr>", "cd to vault" },
--   },
--
--   ["<leader>p"] = {
--     name = "+Plugin",
--     i = { "<cmd>Lazy install<cr>", "Install" },
--     s = { "<cmd>Lazy sync<cr>", "Sync" },
--     S = { "<cmd>Lazy clear<cr>", "Status" },
--     c = { "<cmd>Lazy clean<cr>", "Clean" },
--     u = { "<cmd>Lazy update<cr>", "Update" },
--     p = { "<cmd>Lazy profile<cr>", "Profile" },
--     l = { "<cmd>Lazy log<cr>", "Log" },
--     d = { "<cmd>Lazy debug<cr>", "Debug" },
--     h = { "<cmd>Lazy home<cr>", "Home" },
--   },
--
--   ["<leader>R"] = {
--     name = "+Restore",
--     c = { '<cmd>lua require("persistence").load()<cr>', "Current directory's last session" },
--     l = { '<cmd>lua require("persistence").load({last = true})<cr>', "Last session" },
--   },
--
--   ["<leader>s"] = {
--     name = "+Search",
--     ar = { ":%s/", "Search and replace" },
--     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--     c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--     f = { "<cmd>Telescope find_files<cr>", "Find File" },
--     h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--     H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
--     M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--     R = { "<cmd>Telescope registers<cr>", "Registers" },
--     t = { "<cmd>TodoTelescope<cr>", "Find TODOs" },
--     T = { "<cmd>Telescope live_grep<cr>", "Text" },
--     k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--     C = { "<cmd>Telescope commands<cr>", "Commands" },
--     l = { "<cmd>Telescope resume<cr>", "Resume last search" },
--     p = {
--       "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
--       "Colorscheme with Preview",
--     },
--   },
--
--   ["<leader>v"] = {
--     name = "+VimTex",
--     i = { "<cmd>VimtexInfo<cr>", "VimTex Info" },
--     c = { "<cmd>VimtexCompile<cr>", "VimTex Compile and Cleanup" },
--     a = { "<cmd>VimtexView<cr>", "Trigger forward search" },
--     s = { "<cmd>VimtexStop<cr><cmd>VimtexClean<cr>", "Stop compiler and clean up aux files" },
--     C = { "<cmd>VimtexClean<cr>", "Clean aux files" },
--     r = {
--       "<cmd>lua require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})<cr>",
--       "Reload snippets",
--     },
--   },
--
--   ["<leader>w"] = {
--     name = "+Window",
--     v = { "<C-w>v", "Split vertically" },
--     h = { "<C-w>s", "Split horizontally" },
--     e = { "<C-w>=", "Equalize" },
--     c = { "<cmd>close<cr>", "Close" },
--     m = { "<cmd>MaximizerToggle<cr>", "Maximize window" },
--   },
-- }, n)
--
-- -- Insert mode keymaps
-- wk.register({
--   ["<C-s>"] = { "<esc><cmd>w<cr>", "Save file" },
-- }, i)
--
-- -- Terminal mode keymaps
-- wk.register({
--   ["<C-Bslash>"] = { "<cmd>wincmd h<cr>", "" },
-- }, t)
--
-- -- Visual block mode keymaps
-- wk.register({
--   -- Use K and J in normal mode to move line at cursor up or down respectively
--   ["K"] = { ":m '<-2<cr>gv=gv", "move visual block selection up" },
--   ["J"] = { ":m '>+1<cr>gv=gv", "move line at cursor down" },
-- }, x)
--
-- -- Visual mode keymaps
-- wk.register({
--   ["y"] = { '"+y', "Yank to system clipboard" },
--   ["Y"] = { '"+y$', "Yank to system clipboard (to end of line)" },
--   ["p"] = { '"+p', "Put from system clipboard" },
--   ["P"] = { '"+P', "Put from system clipboard (before cursor)" },
--   ["x"] = { '"+x', "Yank and delete to system clipboard" },
--   ["<leader>s"] = {
--     name = "+Screenshot",
--     c = { ":Silicon<cr>", "Code" },
--     f = { "<cmd>Silicon<cr>", "File" },
--   },
--   -- Use Ctrl + Forward slash to comment the visual selection
--   ["<C-_>"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
--   ["<leader>/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
-- }, v)
