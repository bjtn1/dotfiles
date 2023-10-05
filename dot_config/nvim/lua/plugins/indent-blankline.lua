return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  -- opts = {},
  config = function()
    require("ibl").setup({
      -- for example, context is off by default, use this to turn it on
      -- char = "│",
      -- filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      -- show_trailing_blankline_indent = false,
      -- show_current_context = false,
    })
  end,
}
