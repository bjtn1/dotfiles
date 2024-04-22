local zl =
{
  {
    "folke/neodev.nvim",
    opts = {

    }
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      local mason = require("mason")

      mason.setup({
        ui = {
          border = "rounded",
        },
      })
    end,
  },

  ------------------
  -- Autocompletion
  ------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "onsails/lspkind.nvim",
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      local lsp_kind = require("lspkind")

      cmp.setup({
        preselect = "item",
        completion = {
          completeopt = "menu,menuone,noinsert"
        },
        window = {
          completion = {
            border = "rounded",
          },
          documentation = {
            border = "rounded",
          },
        },
        formatting = {
          format = lsp_kind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<tab>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
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
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },

  {
    "SmiteshP/nvim-navic",
  },

  ------------------
  -- LSP
  ------------------
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      local mason_lsp_config = require("mason-lspconfig")
      local lsp_config = require("lspconfig")

      require("lspconfig.ui.windows").default_options.border = "rounded"

      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        if client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').attach(client, bufnr)
        end
      end)

      mason_lsp_config.setup({
        ensure_installed = {
          "cssls",
          "clangd",
          "cmake",
          "html",
          "jdtls",
          "lua_ls",
          "marksman",
          "pyright",
          "rust_analyzer",
          "tsserver",
          "tailwindcss"
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            lsp_config[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            lsp_config.lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}

local ml = {
  -- NOTE all taken from:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/you-might-not-need-lsp-zero.md
  -- For key notation, see
  -- https://vimdoc.sourceforge.net/htmldoc/intro.html#key-notation
  -- TODO
  -- Make a function that does <cmd>LspInstall<cr> whenever we encounter a filetype that we do not have a server for
  "neovim/nvim-lspconfig",
  priority = 1000,
  dependencies = {
    -- LSP support
    "williamboman/mason.nvim",                -- Optional
    "williamboman/mason-lspconfig.nvim",      -- Optional

    -- Autocompletion
    "hrsh7th/nvim-cmp",                       -- Required
    "hrsh7th/cmp-nvim-lsp",                   -- Required
    "hrsh7th/cmp-buffer",                     -- Optional
    "hrsh7th/cmp-path",                       -- Optional
    "hrsh7th/cmp-cmdline",                    -- Optional
    "hrsh7th/cmp-calc",                       -- Optional
    "saadparwaiz1/cmp_luasnip",               -- Optional
    "hrsh7th/cmp-nvim-lua",                   -- Optional
    "onsails/lspkind.nvim",                   -- Optional

    -- Snippets
    "L3MON4D3/LuaSnip",                       -- Required
    "rafamadriz/friendly-snippets",           -- Optional

    -- Formatter/linter
    -- "jose-elias-alvarez/null-ls.nvim",     -- repo got archived, no longer maintained
    "nvimtools/none-ls.nvim",                 -- same as null-ls, but it is maintained
    "jay-babu/mason-null-ls.nvim",

    -- Useful plugin needed for null-ls
    "nvim-lua/plenary.nvim",

    -- For lua_ls
    "folke/neodev.nvim",

    -- For breadcrumbs
    "SmiteshP/nvim-navic",

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
    local navic_breadcrumbs = require("nvim-navic")

    ---------------------
    -- Neodev
    ---------------------
    neodev.setup({
      library = {
        plugins =
        {
          "luasnip.nvim",
        }
      }
    })

    --------------------
    -- LuaSnip
    --------------------
    ls.config.set_config {
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
      history = true,
      delete_check_events = "TextChanged",
    }

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
        border = "rounded",
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
      border = "rounded",
      sources = {
        -- Add anything not supported by mason here
      },
    })

    ---------------------
    -- nvim-lspconfig
    ---------------------
    require("lspconfig.ui.windows").default_options.border = "rounded"
    local lsp_capabilities = cmp_nvim_lsp.default_capabilities() -- to enable autocompletion

    local lsp_attach = function(client, bufnr)
      navic_breadcrumbs.attach(client, bufnr)
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
            }
          }
        }
      }
    })
  end,
}

return ml
