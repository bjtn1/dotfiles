return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      current_line_blame = true,
      current_line_blame_formatter = '<author>, <author_time:%d of %B %Y at %X> - <summary>',
    })
  end,
}
