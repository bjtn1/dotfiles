return {
  "nvim-neorg/neorg",
  -- ft = "norg",  -- lazy load on filetype
  -- cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
  --  (you could also just remove both lazy loading things)
  priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            folds = false,
            icon_preset = "diamond",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.integrations.treesitter"] = {
          config = {},
        },
        ["core.autocommands"] = {
          config = {},
        },
        ["core.highlights"] = {
          config = {},
        },
        ["core.keybinds"] = {
          config = {},
        },
        ["core.mode"] = {
          config = {},
        },
        ["core.neorgcmd"] = {
          config = {},
        },
      },
    })
  end,
}
