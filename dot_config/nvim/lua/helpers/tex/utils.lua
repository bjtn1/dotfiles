-- Some LaTeX-specific conditional expansion functions (requires VimTeX)
-- source:
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
local u = {}

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


return u
