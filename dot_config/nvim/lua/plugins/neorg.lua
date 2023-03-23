return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  opts = {
    load = {
      ["core.defaults"] = {
        config = {},
      },
      ---------------------
      -- Other modules
      --------------------
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
          workspaces = {
            main = "~/neorg",
          },
          default_workspace = "main",
        },
      },
      ["core.norg.manoeuvre"] = { -- WARN deprecated according to the documentation
        config = {},
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
            { "Authors", "Brandon J. T. Noguera" },
            {
              "Created",
              function()
                return os.date("%Y-%m-%d")
              end,
            },
            {
              "Updated",
              function()
                return os.date("%Y-%m-%d")
              end,
            },
            { "Version", "0.1.0" },
          },
        },
      },
      ["core.autocommands"] = { -- WARN will be deprecated soon
        config = {},
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
      ["core.integrations.nvim-cmp"] = {
        config = {},
      },
    },
  },
}
