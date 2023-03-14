return {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup({
      keywords = {
        fix = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        todo = { icon = " ", color = "info" },
        hack = { icon = " ", color = "warning" },
        warn = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        perf = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        note = { icon = " ", color = "hint", alt = { "INFO" } },
        test = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },

      highlight = {
        before = "fg", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "bg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlightng (vim regex)
      }
    })
  end
}
