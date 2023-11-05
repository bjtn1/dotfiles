-- NOTE this is the lsp set up without zero-lsp
local mlsp = {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LSP support
		"williamboman/mason.nvim", -- Optional
		"williamboman/mason-lspconfig.nvim", -- Optional

		-- Autocompletion
		"hrsh7th/nvim-cmp", -- Required
		"hrsh7th/cmp-nvim-lsp", -- Required
		"hrsh7th/cmp-buffer", -- Optional
		"hrsh7th/cmp-path", -- Optional
		"hrsh7th/cmp-cmdline", -- Optional
		"saadparwaiz1/cmp_luasnip", -- Optional
		"hrsh7th/cmp-nvim-lua", -- Optional
		"onsails/lspkind.nvim", -- Optional

		-- Snippets
		"L3MON4D3/LuaSnip", -- Required
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
		local wk = require("which-key")

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
			-- Error = " ",
			-- Warn = " ",
			-- Hint = " ",
			-- Info = " ",
      Error = "",
      Warn = "",
      Hint = "",
      Info = ""
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
				"arduino_language_server",
				"asm_lsp",
				-- "bashls", -- NOTE dog i cannot get this shit to download LMAO
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
				-- NOTE
				-- Add anything not supported by mason here
			},
		})

		---------------------
		-- nvim-lspconfig
		---------------------
		require("lspconfig.ui.windows").default_options.border = "rounded"
		local lsp_capabilities = cmp_nvim_lsp.default_capabilities() -- to enable autocompletion

		local lsp_attach = function(client, bufnr)
			-- NOTE Available keybinds
			-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts) 
			-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			-- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			-- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			-- vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			-- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			-- vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
			-- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			-- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
			wk.register({
				["<leader>l"] = {
					name = "+LSP",
					K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Display information" },
					d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition" },
					D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump to declaration" },
					i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "View implementations" },
					o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "View type definition" },
					R = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
					r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
					F = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
					e = { "<cmd>lua vim.lsp.buf.diagnostic.open_float()<cr>", "Show diagnostics" },

					s = { "<cmd>LspInfo<cr>", "Show attached servers" },
					f = { "<cmd>NullLsInfo<cr>", "Show attached formatters & linters" },
				},
			}, { buffer = bufnr })
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

-- NOTE this is the lsp using lsp zero
local zlsp = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",

    -- Autocompletion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",

		-- LSP support
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Formatter/linter
		"jose-elias-alvarez/null-ls.nvim",
		"jay-babu/mason-null-ls.nvim",

    -- Cool symbols in autocompletion menu
		"onsails/lspkind.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
		-- local mason_null_ls = require("mason-null-ls")
		-- local null_ls = require("null-ls")
		local wk = require("which-key")
		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local cmp = require("cmp")
		local lsp_kind = require("lspkind")
		local luasnip = require("luasnip")

		lsp_zero.on_attach(function(client, bufnr)
			-- TODO add keybinds to wk.register right here
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts) 
			-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			-- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			-- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			-- vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			-- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			-- vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
			-- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			-- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
			-- lsp_zero.default_keymaps({ buffer = bufnr })

			wk.register({
				["<leader>l"] = {
					name = "+LSP",
					K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Display information" },
					d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition" },
					D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump to declaration" },
					i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "View implementations" },
					o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "View type definition" },
					R = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
					r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
					F = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
					e = { "<cmd>lua vim.lsp.buf.diagnostic.open_float()<cr>", "Show diagnostics" },

					s = { "<cmd>LspInfo<cr>", "Show attached servers" },
					f = { "<cmd>NullLsInfo<cr>", "Show attached formatters & linters" },
				},
			}, { buffer = bufnr })
		end)


    mason.setup({
      ui = {
        border = "rounded"
      }
    })

    local lua_opts = lsp_zero.nvim_lua_ls()
    lspconfig.lua_ls.setup(lua_opts)

    mason_lspconfig.setup({
      handlers = {
        lsp_zero.default_setup,
      }
    })

    lsp_zero.set_sign_icons({
			-- error = " ",
			-- warn = " ",
			-- hint = " ",
			-- info = " ",
      error = "",
      warn = "",
      hint = "",
      info = ""
    })

		vim.diagnostic.config({
			virtual_text = {
				prefix = "",
			},
		})

		require("lspconfig.ui.windows").default_options.border = "rounded"

		---------------------
		-- Autocompletion
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

    
		-- TEST
		local function bruh()
			print("ooga")
		end

		bruh()
	end,
}

return mlsp
