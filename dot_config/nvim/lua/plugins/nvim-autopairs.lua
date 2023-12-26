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

  npairs.add_rules({
    Rule("$", "$",{"tex", "latex", "md"})
      -- don't add a pair if the next character is $
      :with_pair(cond.not_after_regex("$$"))
    })

    npairs.add_rules({
      Rule("$$","$$","tex")
        :with_pair(function(opts)
          print(vim.inspect(opts))
          if opts.line=="aa $$" then
            -- don't add pair on that line
            return false
          end
        end)
    })

    npairs.add_rule(Rule("\\[","\\]","tex"))

    tabout.setup({
      tabkey = "jk",
      backwards_tabkey = "kj",
    })
  end
}
