return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      direction = "float",
      float_opts = {
        border = "rounded",
      },
    })

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _Lazygit_toggle()
      lazygit:toggle()
    end

  end
}
