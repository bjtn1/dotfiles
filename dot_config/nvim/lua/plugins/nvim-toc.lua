return {
  "richardbizik/nvim-toc",
  config = function ()
    local nvim_toc = require("nvim-toc")

    nvim_toc.setup({
      toc_header = "Table of contents",
    })
  end,
}
