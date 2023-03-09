return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function ()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.luacheck,
      }
    })
  end
}
