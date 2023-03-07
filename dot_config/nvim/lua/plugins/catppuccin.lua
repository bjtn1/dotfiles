return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha"
  },
  config = function ()
    require("catppuccin").setup(opts)
  end
}
