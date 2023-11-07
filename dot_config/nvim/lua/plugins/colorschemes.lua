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
    "rose-pine/neovim",
  },
  config = function()
    -- local everblush = require("everblush")
    local ayu = require("ayu")
    local catpuccin = require("catppuccin")
    local dracula = require("dracula")
    local everforest = require("everforest")
    local gruvbox = require("gruvbox")
    local horizon = require("horizon")
    local kanagawa = require("kanagawa")
    local material = require("material")
    local monokai = require("monokai")
    local nightfox = require("nightfox")
    local rose_pine = require("rose-pine")
    local synthwave84 = require("synthwave84")
    local tokyonight = require("tokyonight")

    -- everblush.setup({})

    ayu.setup({})
    catpuccin.setup({
      transparent_background = true,
    })
    everforest.setup({
    dracula.setup({})
      background = "hard",
    })
    gruvbox.setup({})
    horizon.setup({})
    kanagawa.setup({
      transparent = true,
    })
    material.setup({})
    monokai.setup({})
    nightfox.setup({})
    rose_pine.setup({
      disable_background = true,
    })

    tokyonight.setup({
      transparent = true,
    })

    function ColorMyPencils(color)
    	color = color or "rose-pine"
    	vim.cmd.colorscheme(color)

    	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    ColorMyPencils()
    synthwave84.setup({})
  end,
}
