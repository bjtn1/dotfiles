return
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        window = {
          border = "single"
        },
        layout = {
          spacing = 10,
          align = "left",
        }
      })
    end
  }
