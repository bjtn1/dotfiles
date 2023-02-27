return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.1',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()

    local actions = require("telescope.actions")

    require("telescope").setup{
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<ESC>"] = actions.close,
            ["<C-u>"] = false,
            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
          }
        }
      }
    }
    require('telescope').load_extension('fzf')
  end
}
