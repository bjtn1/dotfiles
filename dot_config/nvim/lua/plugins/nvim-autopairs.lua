return {
  "windwp/nvim-autopairs",
  dependencies = {
    "abecodes/tabout.nvim",
    "nvim-nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  version = false,
  config = function()
    local Rule = require("nvim-autopairs.rule")
    local npairs = require("nvim-autopairs")
    local cond = require("nvim-autopairs.conds")
    local tabout = require("tabout")

    npairs.setup({})
    -- npairs.get_rules("(")[1].not_filetypes = { "tex", }
    -- npairs.get_rules("[")[1].not_filetypes = { "tex", }
    -- npairs.get_rules("{")[1].not_filetypes = { "tex", }

    -- npairs.add_rules({
    --   Rule("$", "$",{"tex", "latex", "md", "markdown",})
    --   -- Don't add $ if the next char is $
    --   -- :with_pair(cond.not_after_regex("$"))
    -- })

    npairs.add_rule(Rule("\\[","\\]","tex"))

    tabout.setup({
      tabkey = "jk",
      backwards_tabkey = "kj",
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'},
      },
      ignore_beginning = false,
    })
  end
}
