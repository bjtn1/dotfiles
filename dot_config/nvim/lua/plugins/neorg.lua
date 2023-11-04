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


return {
  "nvim-neorg/neorg",
  ft = "norg",  -- lazy load on filetype
  -- cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
  --  (you could also just remove both lazy loading things)
  priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
  config = function()
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
                -- TODO
                "Title",
                get_file_name()
              },
              {
                "Author(s)",
                "Brandon J. T. Noguera"
              },
              {
                -- TODO
                "Created",
                get_current_date() .. " (" .. get_timestamp() .. ")"
              },
              {
                -- TODO
                "Updated",
                get_current_date() .. " (" .. get_timestamp() .. ")"

              }
            }
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
        ["core.export"] = {
          config = {},
        },
      },
    })
  end,
}
