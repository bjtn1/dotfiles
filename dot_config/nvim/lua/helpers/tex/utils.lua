-- Some LaTeX-specific conditional expansion functions (requires VimTeX)
-- source(s):
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
-- https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/lua/personal/luasnip-helper-funcs.lua
-- https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/delimiter.lua
local u = {}
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node


-- Line begin detection
u.line_begin = require("luasnip.extras.expand_conditions").line_begin

-- math context detection 
u.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end

u.in_text = function() return not u.in_mathzone() end

-- comment detection
u.in_comment = function() return vim.fn['vimtex#syntax#in_comment']() == 1 end

u.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- A few concrete environments---adapt as needed
-- equation environment detection 
u.in_equation = function() return u.in_env('equation') end

-- itemize environment detection
u.in_itemize = function() return u.in_env('itemize') end

-- TikZ picture environment detection
u.in_tikz = function() return u.in_env('tikzpicture') end

-- Minted (code) environement
u.in_codezone = function() return u.in_env('minted') end

-- Add an ampersand before an equal sign in align environments
u.in_align = function() return u.in_env('align') end

u.in_gather = function() return u.in_env('gather') end

u.in_bmatrix = function() return u.in_env('bmatrix') end

u.in_table = function() return u.in_env('tabular') end

u.in_split = function() return u.in_env('split') end

-- Taken from https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/lua/personal/luasnip-helper-funcs.lua
function u.get_ISO_8601_date()
  return os.date("%Y-%m-%d")
end

function u.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

return u
