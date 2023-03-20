return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup({
      highlight = {
        multiline_context = 100,
        -- TODO ooga
        -- HACK booga
        -- PERF ooga
        -- FIX Dick
        -- WARN ooga
        -- NOTE booga
        keyword = "bg",                 -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlightng (vim regex)
      },
    })
  end,
}
