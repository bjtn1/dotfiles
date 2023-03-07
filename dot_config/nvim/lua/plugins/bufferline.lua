return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function ()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        separator_style = "thin",
      }
    })
  end
}
