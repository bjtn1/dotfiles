return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  opts = {
    load = {
      ["core.defaults"] = {
        config = {},
      },
      ["core.export"] = {
        config = {},
      },
      ["core.export.markdown"] = {
        config = {
          extensions = "all",
        },
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.norg.concealer"] = {
        config = {
          folds = false,
        },
      },
      ["core.norg.dirman"] = {
        config = {
          -- workspaces = {
          --   main = "~/notes",
          -- },
        },
      },
      ["core.presenter"] = {
        config = {
          zen_mode = "truezen",
        },
      },
      ----------------------
      -- Developer modules
      ----------------------
      ["core.keybinds"] = {
        config = {},
      },
      ["core.norg.esupports.metagen"] = {
        config = {
          type = "auto",
          template = {
            { "Author(s)", "Brandon J. T. Noguera" },
            {
              "Created",
              function()
                return os.date("%Y-%m-%d")
              end,
            },
          },
        },
      },
      ["core.clipboard"] = {
        config = {},
      },
      ["core.norg.journal"] = {
        config = {},
      },
      ["core.integrations.treesitter"] = {
        config = {},
      },
      ["core.neorgcmd"] = {
        config = {},
      },
      ["core.integrations.nvim-cmp"] = {
        config = {},
      },
      ["core.mode"] = {
        config = {},
      },
    },
  },
}
