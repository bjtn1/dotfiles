return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      direction = "float",
      float_opts = {
        border = MY_BORDER,
        width = function() return math.floor(vim.o.columns * 0.95) end,
        height = function() return math.floor(vim.o.lines * 0.95) end,
      },
    })

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _Lazygit_toggle()
      lazygit:toggle()
    end

  end
}
