-- do ':<Tab>' to see a list of all available commands
local keymap = vim.keymap
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<cr>"

lvim.keys.insert_mode["jj"] = "<ESC>"

lvim.keys.normal_mode["<leader>ch"] = ":nohl<CR>"
lvim.keys.normal_mode["x"] = '"_x'
lvim.keys.normal_mode["<leader>="] = "<C-a>"
lvim.keys.normal_mode["<leader>-"] = "<C-x>"

lvim.keys.normal_mode["<leader>sv"] = "<C-w>v"
lvim.keys.normal_mode["<leader>sh"] = "<C-w>s"
lvim.keys.normal_mode["<leader>se"] = "<C-w>="
lvim.keys.normal_mode["<leader>sx"] = ":close<CR>"

-- lvim.keys.normal_mode["<leader>h"] = "<C-w>h"
-- lvim.keys.normal_mode["<leader>j"] = "<C-w>j"
-- lvim.keys.normal_mode["<leader>k"] = "<C-w>k"
-- lvim.keys.normal_mode["<leader>l"] = "<C-w>l"

---------------------
-- Plugin keymaps
---------------------
-- BufferLine keymappings
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- telescope
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- tpope/vim-surround
keymap.set("n", "sa", "<Plug>Ysurround") -- `sa<motion><delimiter>` to add specified delimiter
keymap.set("n", "sd", "<Plug>Dsurround") -- delete delimiter
keymap.set("n", "sc", "<Plug>Csurround") -- `sc<motion><delimiter_to_change><new_delimiter>` to change delimiter
keymap.set("n", "sal", "<Plug>Yssurround") -- soing "sal" is the same as "yss"

-- szw/vim-maximizer
keymap.set("n", "<leader>mw", ":MaximizerToggle<CR>") -- press "<Space>mw" to maximize current window

-- numToStr/Comment.nvim
keymap.set("n", "co", "<Plug>(comment_toggle_linewise)") -- `co` does the same as `gc`
keymap.set("n", "cl", "<Plug>(comment_toggle_linewise_current)") -- `cl` does the same as `gcc`

-- nvim-tree/nvim-tree.lua
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- open file explorer with `<leader>e`
keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>") -- `<leader>f` focuses the cursor on the file explorer

-- markdown-preview.nvim
lvim.keys.normal_mode["<leader>mp"] = "<Plug>MarkdownPreviewToggle"
