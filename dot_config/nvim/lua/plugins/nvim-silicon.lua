return
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        -- Configuration here, or leave empty to use defaults
        font = "Hack Nerd Font Mono",
        theme = "OneHalfDark",
        background = "#61afef",
        to_clipboard = true,
      })
    end
  }
