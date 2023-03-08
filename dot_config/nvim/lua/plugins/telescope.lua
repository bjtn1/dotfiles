return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.1',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function ()
    require("telescope").setup({
      defaults = {
        mappings = {
          ["<esc>"] = require('telescope.actions').close,
        }
      }
    })
  end
}