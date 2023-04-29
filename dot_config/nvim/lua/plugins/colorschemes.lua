return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "Shatur/neovim-ayu",
    "catppuccin/nvim",
    "Mofiqul/dracula.nvim",
    -- NOTE idk why this one aint working "Everblush/nvim",
    "neanias/everforest-nvim",
    "ellisonleao/gruvbox.nvim",
    "lunarvim/horizon.nvim",
    "rebelot/kanagawa.nvim",
    "marko-cerovac/material.nvim",
    "savq/melange-nvim",
    "kdheepak/monochrome.nvim",
    "tanvirtin/monokai.nvim",
    "EdenEast/nightfox.nvim",
    "LunarVim/synthwave84.nvim",
    "decaycs/decay.nvim",
    "shaunsingh/nord.nvim",
  },
  config = function()
    local ayu = require("ayu")
    local catpuccin = require("catppuccin")
    local dracula = require("dracula")
    -- local everblush = require("everblush")
    local everforest = require("everforest")
    local gruvbox = require("gruvbox")
    local horizon = require("horizon")
    local kanagawa = require("kanagawa")
    local material = require("material")
    local monokai = require("monokai")
    local nightfox = require("nightfox")
    local synthwave84 = require("synthwave84")

    ayu.setup({})
    catpuccin.setup({})
    dracula.setup({})
    -- everblush.setup({})
    everforest.setup({
      background = "hard",
    })
    gruvbox.setup({})
    horizon.setup({})
    kanagawa.setup({})
    material.setup({})
    monokai.setup({})
    nightfox.setup({})
    synthwave84.setup({})
  end,
}
