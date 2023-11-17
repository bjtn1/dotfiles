return {
  "folke/noice.nvim",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    local noice = require("noice")
    local notify = require("notify")
    noice.setup({
      presets = {
        lsp_doc_border = "single",
      },
    })

    notify.setup({
      background_color = "#00000000",
      stages = "static",
    })
  end,
}
