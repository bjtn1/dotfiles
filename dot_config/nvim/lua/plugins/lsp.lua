return {
  -- all taken from:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/you-might-not-need-lsp-zero.md

  -- For key notation, see
  -- https://vimdoc.sourceforge.net/htmldoc/intro.html#key-notation
  "neovim/nvim-lspconfig",
  priority = 1000,
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
    "hrsh7th/cmp-calc",       -- Optional
    "saadparwaiz1/cmp_luasnip", -- Optional
    "hrsh7th/cmp-nvim-lua",   -- Optional
    "onsails/lspkind.nvim",   -- Optional

    -- Snippets
    "L3MON4D3/LuaSnip",           -- Required
    "rafamadriz/friendly-snippets", -- Optional

    -- Formatter/linter
    -- "jose-elias-alvarez/null-ls.nvim",     -- repo got archived, no longer maintained
    "nvimtools/none-ls.nvim", -- same as null-ls, but it is maintained
    "jay-babu/mason-null-ls.nvim",

    -- Useful plugin needed for null-ls
    "nvim-lua/plenary.nvim",

    -- For lua_ls
    "folke/neodev.nvim",

    -- For breadcrumbs
    -- "SmiteshP/nvim-navic",

    -- dont really need this, but I wanna keep it in the cache
    "VonHeikemen/lsp-zero.nvim",
  },
  config = function()
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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
    -- local wk = require("which-key")
    local ls = require("luasnip")
    -- local navic_breadcrumbs = require("nvim-navic")

    ---------------------
    -- Neodev
    ---------------------
    neodev.setup({
      library = {
        plugins = {
          "luasnip.nvim",
        },
      },
    })

    --------------------
    -- LuaSnip
    --------------------
    ls.config.set_config({
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
      history = true,
      delete_check_events = "TextChanged",
    })

    ---------------------
    -- autocompletion
    ---------------------
    require("luasnip/loaders/from_vscode").lazy_load()
    vim.opt.completeopt = "menu,menuone,noselect"

    vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#000000" })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          border = MY_BORDER, -- "none", "single", "double", "rounded", "solid", "shadow" https://neovim.io/doc/user/api.html
          winhighlight = "Normal:CmpNormal",
        },
        documentation = {
          border = MY_BORDER,
          winhighlight = "Normal:CmpNormal",
        },
      },

      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
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
        { name = "calc" },
      }),
      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      }),
      -- comment these (cmdline) out to allow for a cooler cmdline with noice
      -- see this for more info
      -- https://github.com/folke/noice.nvim/discussions/241

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
      -- Error = "",
      -- Warn = "",
      -- Hint = "",
      -- Info = "",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
    })

    ---------------------
    -- Mason
    ---------------------
    mason.setup({
      ui = {
        border = MY_BORDER,
      },
    })

    ---------------------
    -- Mason-lspconfig
    ---------------------
    mason_lsp_config.setup({
      ensure_installed = {
        -- "arduino_language_server",
        -- "asm_lsp",
        "bashls", -- dog i cannot get this shit to download LMAO
        "cssls",
        "clangd",
        "cmake",
        "html",
        "jdtls",
        "julials",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
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
        -- "rustfmt", deprecated: rusfmt should now be installed via rustup
        "stylua",
        ---------------------
        -- Linters
        ---------------------
        "misspell",
        "cmakelint",
        "cpplint",
        "eslint_d",
        "erb-lint",
        -- "flake8", this mf too annoying ngl
        "shellcheck",
        ----------------------------
        -- Formatters & Linters
        ----------------------------
        "cmakelang",
        -- "markdownlint",
      },
      automatic_installation = true,
      handlers = {},
    })

    ---------------------
    -- Null-ls
    ---------------------

    null_ls.setup({
      border = MY_BORDER,
      sources = {
        -- Add anything not supported by mason here
      },
    })

    ---------------------
    -- nvim-lspconfig
    ---------------------
    require("lspconfig.ui.windows").default_options.border = MY_BORDER
    local lsp_capabilities = cmp_nvim_lsp.default_capabilities() -- to enable autocompletion

    local lsp_attach = function(client, bufnr)
      -- uncomment this if you ever want to use breadcrumbs
      -- navic_breadcrumbs.attach(client, bufnr)
      -- this is where you can add keybinds
      -- see the ["<leadaer>l"] entry in the keymaps.lua file to see what used to be here
    end

    local get_servers = mason_lsp_config.get_installed_servers

    for _, server_name in ipairs(get_servers()) do
      lsp_config[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end

    -- This is for luasnip, these are the globals they use
    -- This is so lua_ls doesnt yell at me when it doesnt recognize the globals
    -- that luasnip declares
    lsp_config.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "MY_BORDER",
              "vim",
              "s",
              "t",
              "i",
              "sn",
              "f",
              "c",
              "d",
              "fmt",
              "fmta",
              "rep",
            },
          },
        },
      },
    })
  end,
}
