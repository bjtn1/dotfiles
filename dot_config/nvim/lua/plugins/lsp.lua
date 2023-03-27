local mlsp = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP support
    "williamboman/mason.nvim",         -- Optional
    "williamboman/mason-lspconfig.nvim", -- Optional

    -- Autocompletion
    "hrsh7th/nvim-cmp",       -- Required
    "hrsh7th/cmp-nvim-lsp",   -- Required
    "hrsh7th/cmp-buffer",     -- Optional
    "hrsh7th/cmp-path",       -- Optional
    "hrsh7th/cmp-cmdline",    -- Optional
    "saadparwaiz1/cmp_luasnip", -- Optional
    "hrsh7th/cmp-nvim-lua",   -- Optional
    "onsails/lspkind.nvim",   -- Optional

    -- Snippets
    "L3MON4D3/LuaSnip",           -- Required
    "rafamadriz/friendly-snippets", -- Optional

    -- Formatter/linter
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",

    -- Useful plugin needed for null-ls
    "nvim-lua/plenary.nvim",

    -- For lua_ls
    "folke/neodev.nvim",

    "glepnir/lspsaga.nvim",
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local lsp_config = require("lspconfig")
    local lsp_kind = require("lspkind")
    local lsp_saga = require("lspsaga")
    local luasnip = require("luasnip")
    local mason = require("mason")
    local mason_lsp_config = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    local neodev = require("neodev")
    local null_ls = require("null-ls")
    ---------------------
    -- Neodev
    ---------------------
    neodev.setup({})

    ---------------------
    -- autocompletion
    ---------------------
    require("luasnip/loaders/from_vscode").lazy_load()
    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "neorg" },
      }),
      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      }),
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      }),
      -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      }),
      formatting = {
        format = lsp_kind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    ---------------------
    -- Diagnostics
    ---------------------
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
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
    -- LSP saga
    ---------------------
    lsp_saga.setup({})

    ---------------------
    -- Mason-lspconfig
    ---------------------
    mason_lsp_config.setup({
      ensure_installed = {
        "arduino_language_server",
        "asm_lsp",
        "bashls",
        "cssls",
        "clangd",
        "cmake",
        "html",
        "jdtls",
        "lua_ls",
        "marksman",
        "pyright",
        "tsserver",
      },
    })

    ---------------------
    -- Mason-null-ls
    ---------------------
    mason_null_ls.setup({
      ensure_installed = {
        -- I looked on `:Mason` formatters tab and linters to get these names
        ---------------------
        -- Formatters
        ---------------------
        "beautysh",
        -- "black",
        "clang-format",
        "isort",
        "prettierd",
        "rustfmt",
        "stylua",
        ---------------------
        -- Linters
        ---------------------
        "misspell",
        "cmakelint",
        "cpplint",
        "eslint_d",
        "erb-lint",
        "flake8",
        "shellcheck",
        ----------------------------
        -- Formatters & Linters
        ----------------------------
        "cmakelang",
        -- "markdownlint",
      },
      automatic_setup = true,
    })

    ---------------------
    -- Null-ls
    ---------------------
    local d = null_ls.builtins.diagnostics
    local f = null_ls.builtins.formatting

    null_ls.setup({
      border = "rounded",
      sources = {
        -- NOTE
        -- Add anything not supported by mason here
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

    mason_null_ls.setup_handlers()

    ---------------------
    -- nvim-lspconfig
    ---------------------
    require("lspconfig.ui.windows").default_options.border = "rounded"
    local lsp_capabilities = cmp_nvim_lsp.default_capabilities() -- to enable autocompletion

    local lsp_attach = function(client, bufnr)
      -- TODO add keybinds
    end

    local get_servers = mason_lsp_config.get_installed_servers

    for _, server_name in ipairs(get_servers()) do
      lsp_config[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end
  end,
}

return mlsp
