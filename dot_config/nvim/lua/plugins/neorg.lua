return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  opts = {
    load = {
      ["core.defaults"] = {
        config = {},
      }, -- Loads default behaviour
      ["core.autocommands"] = {
        config = {},
      },
      ["core.presenter"] = {
        config = {
          zen_mode = "truezen",
        },
      },
      ["core.norg.journal"] = {
        config = {},
      },
      ["core.integrations.treesitter"] = {
        config = {},
      },
      ["core.integrations.nvim-cmp"] = {
        config = {},
      },
      ["core.norg.concealer"] = {
        config = {
          folds = false,
        },
      }, -- Adds pretty icons to your documents
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
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            main = "~/neorg",
            notes = "~/neorg/notes",
          },
          default_workspace = "main",
        },
      },
    },
  },
}
