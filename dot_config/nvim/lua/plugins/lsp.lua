-- local zlsp = {
--   "VonHeikemen/lsp-zero.nvim",
--   branch = "v1.x",
--   dependencies = {
--     -- LSP Support
--     "neovim/nvim-lspconfig",           -- Required
--     "williamboman/mason.nvim",         -- Optional
--     "williamboman/mason-lspconfig.nvim", -- Optional
--
--     -- Autocompletion
--     "hrsh7th/nvim-cmp",       -- Required
--     "hrsh7th/cmp-nvim-lsp",   -- Required
--     "hrsh7th/cmp-buffer",     -- Optional
--     "hrsh7th/cmp-path",       -- Optional
--     "hrsh7th/cmp-cmdline",    -- Optional
--     "saadparwaiz1/cmp_luasnip", -- Optional
--     "hrsh7th/cmp-nvim-lua",   -- Optional
--
--     -- Snippets
--     "L3MON4D3/LuaSnip",           -- Required
--     "rafamadriz/friendly-snippets", -- Optional
--
--     -- Formatter/linter
--     "jose-elias-alvarez/null-ls.nvim",
--     "jay-babu/mason-null-ls.nvim",
--
--     -- Useful plugin needed for null-ls
--     "nvim-lua/plenary.nvim",
--   },
--   config = function()
--     local cmp = require("cmp")
--     local lsp_zero = require("lsp-zero")
--     local null_ls = require("null-ls")
--     local mason = require("mason")
--
--     ----------------------------------------
--     -- mason
--     ----------------------------------------
--     mason.setup({
--       ui = {
--         border = "rounded",
--       },
--     })
--
--     ----------------------------------------
--     -- lsp-zero
--     ----------------------------------------
--     lsp_zero.preset({
--       name = "minimal",
--       set_lsp_keymaps = true,
--       manage_nvim_cmp = true,
--       suggest_lsp_servers = true,
--     })
--
--     lsp_zero.nvim_workspace()
--
--     lsp_zero.set_preferences({
--       sign_icons = {
--         error = "",
--         warn = "",
--         hint = "",
--         info = "",
--       },
--     })
--
--     lsp_zero.ensure_installed({
--       "arduino_language_server",
--       "clangd",
--       "cmake",
--       "cssls",
--       "html",
--       "jdtls",
--       "tsserver",
--       "ltex",
--       "lua_ls",
--       "marksman",
--       "pyright",
--       "rust_analyzer",
--       "tailwindcss",
--     })
--
--     vim.diagnostic.config({
--       virtual_text = {
--         prefix = "",
--       },
--     })
--
--     ----------------------------------------
--     -- cmp
--     ----------------------------------------
--     local cmp_config = lsp_zero.defaults.cmp_config({
--       window = {
--         completion = {
--           border = "rounded",
--         },
--         documentation = {
--           border = "rounded",
--         },
--       },
--     })
--
--     cmp.setup(cmp_config)
--
--     ----------------------------------------
--     -- nul-ls
--     ----------------------------------------
--     local null_opts = lsp_zero.build_options("null-ls", {
--       on_attach = function(client)
--         if client.server_capabilities.document_formatting then
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             desc = "Auto format before save",
--             pattern = "<buffer>",
--             callback = vim.lsp.buf.format,
--           })
--         end
--       end,
--     })
--
--     null_ls.setup({
--       on_attach = null_opts.on_attach,
--       sources = {
--         -- TODO add sources
--         null_ls.builtins.formatting.stylua,
--       },
--     })
--     lsp_zero.setup()
--   end,
-- }

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
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local lsp_config = require("lspconfig")
    local lsp_kind = require("lspkind")
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
      }),

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = 'buffer' },
          })
      }),

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      }),

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
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
    -- Mason-lspconfig
    ---------------------
    -- FIXME autopep8 gets attached to .py files, but stylua doesn't. Figure out why
    -- what i'm goin to do is uninstall every server from mason and install lua_ls, stylua, and luacheck one by one and cofigure them

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
        "lua_ls", -- Neodev takes care of this one
        "marksman",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
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
        "autopep8",
        "clang-format",
        "cmakelang",
        "google-java-format",
        "isort",
        "jq",
        "latexindent",
        "markdownlint",
        "prettierd",
        "reorder-python-imports",
        "rustfmt",
        "shellharden",
        "stylua",
        ---------------------
        -- Linters
        ---------------------
        "alex",
        -- "cmakelang"
        "codespell",
        "commitlint",
        "cpplint",
        "cspell",
        "eslint_d",
        "flake8",
        "gitlint",
        "jsonlint",
        -- "markdownlint"
        "misspell",
        "mypy",
        "proselint",
        "pydocstyle",
        "pyflakes",
        "pyproject-flake8",
        -- "shellharden",
        "textlint",
        "vale",
        "vulture",
        "write-good",
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
        ---------------------------------------------------------------------------------------------------------------------------------------------------
        -- Formatters: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
        ---------------------------------------------------------------------------------------------------------------------------------------------------
        f.autopep8,
        f.clang_format,
        f.cmakelang,
        f.google_java_format,
        f.isort,
        f.jq,
        f.latexindent,
        f.markdownlint,
        f.prettierd,
        f.reorder_python_imports,
        f.rustfmt,
        f.stylua,

        ---------------------------------------------------------------------------------------------------------------------------------------------------
        -- Linters/Diagnostics: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
        ---------------------------------------------------------------------------------------------------------------------------------------------------
        d.alex,
        d.cmakelang,
        d.codespell,
        d.commitlint,
        d.cpplint,
        d.cspell,
        d.eslint_d,
        d.flake8,
        d.gitlint,
        d.jsonlint,
        d.markdownlint,
        d.misspell,
        d.mypy,
        d.proselint,
        d.pydocstyle,
        d.pyflakes,
        d.pyproject_flake8,
        d.textlint,
        d.vale,
        d.vulture,
        d.write_good,
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

    -- TODO mason-null-ls add shit. When i do :Mason and check the formatter, stylua aint there why tf is that

    ---------------------
    -- nvim-lspconfig
    ---------------------
    require('lspconfig.ui.windows').default_options.border = "rounded"
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
