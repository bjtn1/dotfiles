return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  opts = {
    window = {
      position = "float",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require("neo-tree").setup(opts)
  end
}
