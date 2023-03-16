-- return {}
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP support
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
    "nvim-lua/plenary.nvim",

    -- For lua_ls
    "folke/neodev.nvim",
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local lsp_config = require("lspconfig")
    local mason = require("mason")
    local mason_lsp_config = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    local neodev = require("neodev")
    local null_ls = require("null-ls")

    ---------------------
    -- Neodev
    ---------------------
    neodev.setup({})


    local lsp_capabilities = cmp_nvim_lsp.default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- TODO format on save
    end

    ---------------------
    -- Diagnostics
    ---------------------
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " "
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      }
    })

    ---------------------
    -- Mason
    ---------------------
    mason.setup({
      ui = {
        border = "rounded",
      },
    })

    ---------------------
    -- Mason-lspconfig
    ---------------------
    mason_lsp_config.setup({
      ensure_installed = {
        "arduino_language_server",
        "clangd",
        "cmake",
        "cssls",
        "html",
        "jdtls",
        "tsserver",
        "ltex",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
      }
    })

    local get_servers = mason_lsp_config.get_installed_servers

    for _, server_name in ipairs(get_servers()) do
      lsp_config[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end

    ---------------------
    -- Null-ls
    ---------------------
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.spell,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
