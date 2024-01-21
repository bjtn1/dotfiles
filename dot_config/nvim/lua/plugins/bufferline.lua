return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        indicator = {
          style = "icon",
        },
        numbers = "ordinal",
        offsets = {
          {
            filetype = "NeoTree",
            text = "File Explorer",
            text_align = "left", -- | "center" | "right"
            separator = true
          }
        },
      },
    })

    vim.cmd[[
      nnoremap <silent><leader>1 <cmd>lua require("bufferline").go_to(1, true)<cr>
      nnoremap <silent><leader>2 <cmd>lua require("bufferline").go_to(2, true)<cr>
      nnoremap <silent><leader>3 <cmd>lua require("bufferline").go_to(3, true)<cr>
      nnoremap <silent><leader>4 <cmd>lua require("bufferline").go_to(4, true)<cr>
      nnoremap <silent><leader>5 <cmd>lua require("bufferline").go_to(5, true)<cr>
      nnoremap <silent><leader>6 <cmd>lua require("bufferline").go_to(6, true)<cr>
      nnoremap <silent><leader>7 <cmd>lua require("bufferline").go_to(7, true)<cr>
      nnoremap <silent><leader>8 <cmd>lua require("bufferline").go_to(8, true)<cr>
      nnoremap <silent><leader>9 <cmd>lua require("bufferline").go_to(9, true)<cr>
      nnoremap <silent><leader>$ <cmd>lua require("bufferline").go_to(-1, true)<cr>
      ]]
  end,
}
