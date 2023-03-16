return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",             -- Required
    "williamboman/mason.nvim",           -- Optional
    "williamboman/mason-lspconfig.nvim", -- Optional

    -- Autocompletion
    "hrsh7th/nvim-cmp",         -- Required
    "hrsh7th/cmp-nvim-lsp",     -- Required
    "hrsh7th/cmp-buffer",       -- Optional
    "hrsh7th/cmp-path",         -- Optional
    "hrsh7th/cmp-cmdline",      -- Optional
    "saadparwaiz1/cmp_luasnip", -- Optional
    "hrsh7th/cmp-nvim-lua",     -- Optional

    -- Snippets
    "L3MON4D3/LuaSnip",             -- Required
    "rafamadriz/friendly-snippets", -- Optional

    -- Formatter/linter
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",

    -- Useful plugin needed for null-ls
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local lsp = require("lsp-zero")
    local cmp = require("cmp")
    local null_ls = require("null-ls")
    local mason_null_ls = require("mason-null-ls")
    local mason = require("mason")

    -------------------------------------------------------
    -- lsp-zero config
    --------------------------------------------------------
    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()

    -- This preset gives you the option to have full control over nvim-cmp
    -- `:h lsp-zero-presets` for more
    lsp.preset("lsp-compe")

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })

    -------------------------------------------------------
    -- nvim-cmp config
    --------------------------------------------------------
    -- TODO set up the mappings part of nvim-cmp
    local cmp_config = lsp.defaults.cmp_config({
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      }
    })

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    cmp.setup(cmp_config)

    -------------------------------------------------------
    -- Mason config
    --------------------------------------------------------
    mason.setup({
      ui = {
        border = "rounded",
      },
    })

    local null_opts = lsp.build_options("null-ls", {
      on_attach = function(client)
        if client.server_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.format,
          })
        end
      end
    })

    null_ls.setup({
      border = "rounded",
      on_attach = null_opts.on_attach,
      sources = {
      }
    })

    mason_null_ls.setup({
      ensure_installed = nil,
      automatic_installation = true,
      automatic_setup = false,
    })
  end
}
