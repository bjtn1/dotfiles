return {
  "xiyaowong/transparent.nvim",
  config = function()
    local vim_transparent = require("transparent")
    vim_transparent.setup({
      extra_groups = {
        "NeoTree",
      },
    })
  end,
}
