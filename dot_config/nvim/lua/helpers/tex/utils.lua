-- Some LaTeX-specific conditional expansion functions (requires VimTeX)
-- source:
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
local utils = {}

-- Line begin detection
utils.line_begin = require("luasnip.extras.expand_conditions").line_begin

-- math context detection 
utils.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end

utils.in_text = function() return not utils.in_mathzone() end

-- comment detection
utils.in_comment = function() return vim.fn['vimtex#syntax#in_comment']() == 1 end

utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- A few concrete environments---adapt as needed
-- equation environment detection 
utils.in_equation = function() return utils.in_env('equation') end

-- itemize environment detection
utils.in_itemize = function() return utils.in_env('itemize') end

-- TikZ picture environment detection
utils.in_tikz = function() return utils.in_env('tikzpicture') end

-- Minted (code) environement
utils.in_codezone = function() return utils.in_env('minted') end

-- Add an ampersand before an equal sign in align environments
utils.in_align = function() return utils.in_env('align') end

utils.in_gather = function() return utils.in_env('gather') end


return utils
