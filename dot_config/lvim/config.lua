-- plugins
lvim.plugins =
{
  {
    "archibate/lualine-time"
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function ()
      local neotree = require("neo-tree")

      neotree.setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
          },
          follow_current_file = {
            enabled = true,
          },
        },
      })
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    config = function ()
    end
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",  -- lazy load on filetype
    -- cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
    --  (you could also just remove both lazy loading things)
    priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
    -- version = "v7.0.0", -- This is the important part!
    -- dependencies = { "luarocks.nvim" },
    config = function()
      -- NOTE functions taken from:
      -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/esupports/metagen/module.lua
      local function get_timezone_offset()
        -- http://lua-users.org/wiki/TimeZon
        -- return the timezone offset in seconds, as it was on the time given by ts
        -- Eric Feliksik
        local utcdate = os.date("!*t", 0)
        local localdate = os.date("*t", 0)
        localdate.isdst = false -- this is the trick
        return os.difftime(os.time(localdate), os.time(utcdate))
      end


      local function get_timestamp()
        -- generate a ISO-8601 timestamp
        -- example: 2023-09-05T09:09:11-0500
        local tz_offset = get_timezone_offset()
        local h, m = math.modf(tz_offset / 3600)
        return os.date("%Y-%m-%dT%H:%M:%S") .. string.format("%+.4d", h * 100 + m * 60)
      end


      local function get_current_date()
        return os.date("%d of %B, %Y at %H:%M:%S")
      end


      local function get_file_name()
        local fileName = vim.fn.expand("%:p:t:r")
        -- Capitalize the first letter
        fileName = fileName:gsub("^%l", string.upper)
        return fileName
      end

      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              folds = false,
              icon_preset = "diamond",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.integrations.treesitter"] = {
            config = {},
          },
          ["core.autocommands"] = {
            config = {},
          },
          ["core.esupports.metagen"] = {
            config = {
              template = {
                {
                  "Title",
                  get_file_name()
                },
                {
                  "Author(s)",
                  "Brandon J. T. Noguera"
                },
                {
                  "Created",
                  get_current_date() .. " (" .. get_timestamp() .. ")"
                },
                {
                  "Updated",
                  get_current_date() .. " (" .. get_timestamp() .. ")"

                }
              },
              update_date = true,
            },
          },
          ["core.highlights"] = {
            config = {},
          },
          ["core.keybinds"] = {
            config = {},
          },
          ["core.mode"] = {
            config = {},
          },
          ["core.neorgcmd"] = {
            config = {},
          },
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        highlight = {
          multiline_context = 100,
          -- ooga TODO booga
          -- ooga HACK booga
          -- ooga PERF booga
          -- ooga FIX booga
          -- ooga WARN ooga
          -- ooga NOTE booga

          -- before = "fg",
          keyword = "bg",             -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlightng (vim regex)
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      local noice = require("noice")
      local notify = require("notify")
      -- This all came from the wiki
      -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
      noice.setup({
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
        },
        presets = {
          lsp_doc_border = "single",
        },
      })

      notify.setup({
        background_color = "#00000000",
        stages = "static",
      })
    end,
  },
}

-- bultins
lvim.builtin.nvimtree.active = false

lvim.builtin.lualine.options.theme = "tokyonight"
lvim.builtin.lualine.options.component_separators = "|"
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.sections.lualine_a = {
  "filename"
}

lvim.builtin.lualine.sections.lualine_b = {
  require("noice").api.statusline.mode.get,
  cond = require("noice").api.statusline.mode.has,
  color = { fg = {"#ff9e64"} },
}

lvim.builtin.lualine.sections.lualine_c = {
  "branch"
}
lvim.builtin.lualine.sections.lualine_y = {
  "cdate"
}
lvim.builtin.lualine.sections.lualine_z = {
  "ctime"
}

-- colorscheme
lvim.transparent_window = true
lvim.builtin.theme.tokyonight = true
lvim.colorscheme = "tokyonight-night"

-- options
vim.opt.clipboard = ""
vim.opt.timeout = true
vim.opt.timeoutlen = 100

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")

vim.opt.laststatus = 0

vim.opt.guicursor = "i-c-ci-sm:ver25-blinkon100,n-v-ve-o-r-cr:blinkon100"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.fillchars:append("eob: ")

-- keybinds
lvim.keys.normal_mode["<C-s>"]          = "<esc><cmd>w<cr>"
lvim.keys.normal_mode["H"]              = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["J"]              = "<cmd>m .+1<cr>=="
lvim.keys.normal_mode["K"]              = "<cmd>m .-2<cr>=="
lvim.keys.normal_mode["L"]              = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["y"]              = '"+y'
lvim.keys.normal_mode["Y"]              = '"+y$'
lvim.keys.normal_mode["p"]              = '"+p'
lvim.keys.normal_mode["P"]              = '"+P'
lvim.keys.normal_mode["<C-Bslash>"]     = "<cmd>Toggleterm<cr>"
-- lvim.keys.normal_mode["<leader>h"]      = "<cmd>noh<cr>"

lvim.keys.normal_mode["sa"]             = "<Plug>Ysurround"
lvim.keys.normal_mode["sd"]             = "<Plug>Dsurround"
lvim.keys.normal_mode["sc"]             = "<Plug>Csurround"
lvim.keys.normal_mode["sA"]             = "<Plug>Yssurround"

lvim.keys.visual_mode["y"]              = '"+y'
lvim.keys.visual_mode["Y"]              = '"+y$'
lvim.keys.visual_mode["p"]              = '"+p'
lvim.keys.visual_mode["P"]              = '"+P'
lvim.keys.visual_mode["J"]              = ":m '>+1<cr>gv=gv"
lvim.keys.visual_mode["K"]              = ":m '<-2<cr>gv=gv"

lvim.builtin.which_key.vmappings["s"] = {
  name = "+Screenshot",
  c = { "<cmd>Silicon<cr>", "Code" },
  f = { "<cmd>Silicon<cr>", "File" }
}

lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle current reveal_force_cwd<cr><cmd>set nu<cr><cmd>set rnu<cr>", "Explorer" }

lvim.keys.insert_mode["<C-s>"] = "<esc><cmd>w<cr>"


-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
