-- Colorscheme generated live from the current wallpaper's pywal palette.
-- Source of truth: ~/.cache/wal/colors.json, regenerated on every wallpaper
-- change by ~/.config/scripts/apply-pywal-colorscheme (Linux, SUPER+W) or
-- wal-wallpaper-watch.sh (macOS launchd agent) -- same cache path either way.
-- A timer below polls that file's mtime and repaints automatically.

local cache_path = vim.fn.expand("~/.cache/wal/colors.json")

local ok, raw = pcall(vim.fn.readfile, cache_path)
if not ok or vim.tbl_isempty(raw) then
  vim.notify("wallpaper colorscheme: couldn't read " .. cache_path, vim.log.levels.ERROR)
  return
end

local decode_ok, palette = pcall(vim.json.decode, table.concat(raw, "\n"))
if not decode_ok then
  vim.notify("wallpaper colorscheme: couldn't parse " .. cache_path, vim.log.levels.ERROR)
  return
end

if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "wallpaper"

local c = palette.colors
local s = palette.special

-- Standard base16-style slot semantics: 1=red/error, 2=green/string,
-- 3=yellow/warning, 4=blue/function, 5=magenta/keyword, 6=cyan/type.
local bg = s.background
local fg = s.foreground
local red = c.color1
local green = c.color2
local yellow = c.color3
local blue = c.color4
local magenta = c.color5
local cyan = c.color6
local gray = c.color8
local byellow = c.color11
local bmagenta = c.color13

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base UI
hl("Normal", { fg = fg, bg = bg })
hl("NormalFloat", { fg = fg, bg = bg })
hl("NormalNC", { fg = fg, bg = bg })
hl("FloatBorder", { fg = gray, bg = bg })
hl("Cursor", { fg = bg, bg = fg })
hl("CursorLine", { bg = "#121212" })
hl("CursorLineNr", { fg = byellow, bold = true })
hl("CursorColumn", { bg = "#121212" })
hl("ColorColumn", { bg = "#121212" })
hl("LineNr", { fg = gray })
hl("SignColumn", { fg = gray, bg = bg })
hl("Visual", { bg = "#333333" })
hl("VisualNOS", { bg = "#333333" })
hl("Search", { fg = bg, bg = yellow })
hl("IncSearch", { fg = bg, bg = byellow })
hl("CurSearch", { fg = bg, bg = byellow })
hl("MatchParen", { fg = byellow, bold = true, underline = true })

hl("StatusLine", { fg = fg, bg = "#161616" })
hl("StatusLineNC", { fg = gray, bg = "#101010" })
hl("WinSeparator", { fg = gray, bg = bg })
hl("VertSplit", { fg = gray, bg = bg })
hl("TabLine", { fg = gray, bg = "#101010" })
hl("TabLineFill", { bg = "#101010" })
hl("TabLineSel", { fg = bg, bg = blue })

hl("Pmenu", { fg = fg, bg = "#161616" })
hl("PmenuSel", { fg = bg, bg = blue })
hl("PmenuSbar", { bg = "#161616" })
hl("PmenuThumb", { bg = gray })

hl("NonText", { fg = gray })
hl("Whitespace", { fg = gray })
hl("EndOfBuffer", { fg = gray })
hl("Folded", { fg = gray, bg = "#101010" })
hl("FoldColumn", { fg = gray, bg = bg })

-- Syntax (classic groups)
hl("Comment", { fg = gray, italic = true })
hl("Constant", { fg = bmagenta })
hl("String", { fg = green })
hl("Character", { fg = green })
hl("Number", { fg = bmagenta })
hl("Boolean", { fg = bmagenta })
hl("Float", { fg = bmagenta })

hl("Identifier", { fg = fg })
hl("Function", { fg = blue, bold = true })

hl("Statement", { fg = red })
hl("Conditional", { fg = red })
hl("Repeat", { fg = red })
hl("Label", { fg = red })
hl("Operator", { fg = cyan })
hl("Keyword", { fg = magenta, bold = true })
hl("Exception", { fg = red })

hl("PreProc", { fg = cyan })
hl("Include", { fg = cyan })
hl("Define", { fg = cyan })
hl("Macro", { fg = cyan })
hl("PreCondit", { fg = cyan })

hl("Type", { fg = yellow })
hl("StorageClass", { fg = yellow })
hl("Structure", { fg = yellow })
hl("Typedef", { fg = yellow })

hl("Special", { fg = cyan })
hl("SpecialChar", { fg = cyan })
hl("Tag", { fg = red })
hl("Delimiter", { fg = fg })
hl("SpecialComment", { fg = gray, italic = true })
hl("Debug", { fg = red })

hl("Underlined", { fg = blue, underline = true })
hl("Ignore", { fg = gray })
hl("Error", { fg = bg, bg = red })
hl("Todo", { fg = bg, bg = byellow, bold = true })

-- Diff
hl("DiffAdd", { fg = green, bg = "#0d1f0d" })
hl("DiffChange", { fg = yellow, bg = "#1f1a0d" })
hl("DiffDelete", { fg = red, bg = "#1f0d0d" })
hl("DiffText", { fg = byellow, bg = "#1f1a0d", bold = true })

-- Diagnostics
hl("DiagnosticError", { fg = red })
hl("DiagnosticWarn", { fg = yellow })
hl("DiagnosticInfo", { fg = blue })
hl("DiagnosticHint", { fg = cyan })
hl("DiagnosticUnderlineError", { undercurl = true, sp = red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = cyan })

-- Treesitter -- link onto the classic groups above so every capture group
-- gets a sane color without hand-tuning each one individually.
local ts_links = {
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Statement",
  ["@variable.parameter"] = "Identifier",
  ["@variable.member"] = "Identifier",
  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@module"] = "Type",
  ["@string"] = "String",
  ["@string.escape"] = "SpecialChar",
  ["@character"] = "Character",
  ["@number"] = "Number",
  ["@boolean"] = "Boolean",
  ["@function"] = "Function",
  ["@function.builtin"] = "Function",
  ["@function.call"] = "Function",
  ["@method"] = "Function",
  ["@method.call"] = "Function",
  ["@constructor"] = "Type",
  ["@keyword"] = "Keyword",
  ["@keyword.function"] = "Keyword",
  ["@keyword.return"] = "Keyword",
  ["@keyword.operator"] = "Operator",
  ["@conditional"] = "Conditional",
  ["@repeat"] = "Repeat",
  ["@label"] = "Label",
  ["@operator"] = "Operator",
  ["@exception"] = "Exception",
  ["@type"] = "Type",
  ["@type.builtin"] = "Type",
  ["@attribute"] = "PreProc",
  ["@property"] = "Identifier",
  ["@field"] = "Identifier",
  ["@parameter"] = "Identifier",
  ["@tag"] = "Tag",
  ["@tag.attribute"] = "Identifier",
  ["@tag.delimiter"] = "Delimiter",
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.bracket"] = "Delimiter",
  ["@punctuation.special"] = "Special",
  ["@comment"] = "Comment",
  ["@comment.todo"] = "Todo",
  ["@markup.heading"] = "Function",
  ["@markup.strong"] = "Keyword",
  ["@markup.italic"] = "Comment",
  ["@markup.link"] = "Underlined",
  ["@markup.raw"] = "String",
}
for group, link in pairs(ts_links) do
  vim.api.nvim_set_hl(0, group, { link = link })
end

-- Auto-repaint: poll the cache file's mtime and reapply this whole file
-- whenever it changes. Guarded so re-running `:colorscheme wallpaper` (which
-- re-executes this file, including this block) doesn't stack up timers.
if not vim.g._wallpaper_colorscheme_watching then
  vim.g._wallpaper_colorscheme_watching = true

  local uv = vim.uv or vim.loop
  local last_mtime = vim.fn.getftime(cache_path)
  local timer = uv.new_timer()

  timer:start(
    2000,
    2000,
    vim.schedule_wrap(function()
      if vim.g.colors_name ~= "wallpaper" then
        return
      end
      local mtime = vim.fn.getftime(cache_path)
      if mtime ~= last_mtime then
        last_mtime = mtime
        vim.cmd.colorscheme("wallpaper")
      end
    end)
  )

  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(args)
      if args.match ~= "wallpaper" and not timer:is_closing() then
        timer:stop()
        timer:close()
        vim.g._wallpaper_colorscheme_watching = false
      end
    end,
  })
end
