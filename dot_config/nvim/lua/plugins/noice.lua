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
    -- This all came from the wiki
    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
    noice.setup({
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
      -- NOTE
      -- This turned out to be annoying. Using lualine  instead
      -- routes = {
      --   {
      --     view = "notify",
      --     filter = { event = "msg_showmode" },
      --   }
      -- },
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
