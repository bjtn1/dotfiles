return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "Shatur/neovim-ayu",
    "catppuccin/nvim",
    "Mofiqul/dracula.nvim",
    -- "Everblush/nvim",                 -- not working
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
    local catppuccin = require("catppuccin")
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

    -- mocha flavours taken from:
    -- https://github.com/catppuccin/nvim/discussions/323
    local led_mocha = {
      mocha = {
        rosewater = "#efc9c2",
        flamingo = "#ebb2b2",
        pink = "#f2a7de",
        mauve = "#b889f4",
        red = "#ea7183",
        maroon = "#ea838c",
        peach = "#f39967",
        yellow = "#eaca89",
        green = "#96d382",
        teal = "#78cec1",
        sky = "#91d7e3",
        sapphire = "#68bae0",
        blue = "#739df2",
        lavender = "#a0a8f6",
        text = "#b5c1f1",
        subtext1 = "#a6b0d8",
        subtext0 = "#959ec2",
        overlay2 = "#848cad",
        overlay1 = "#717997",
        overlay0 = "#63677f",
        surface2 = "#505469",
        surface1 = "#3e4255",
        surface0 = "#2c2f40",

        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    }

    catppuccin.setup({
      color_overrides = led_mocha,
      integrations = {
        alpha = true,
        aerial = true,
        dap = true,
        dap_ui = true,
        mason = true,
        neotree = true,
        notify = true,
        nvimtree = false,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        ts_rainbow = false,
        which_key = true,
      },
    })

    everforest.setup({
      background = "hard",
    })

    dracula.setup({})

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
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })

    synthwave84.setup({})
  end,
}
