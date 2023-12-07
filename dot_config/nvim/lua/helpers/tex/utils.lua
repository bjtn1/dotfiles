-- Some LaTeX-specific conditional expansion functions (requires VimTeX)
-- source:
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
local tex_utils = {}

-- math context detection 
tex_utils.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end

tex_utils.in_text = function() return not tex_utils.in_mathzone() end

-- comment detection
tex_utils.in_comment = function() return vim.fn['vimtex#syntax#in_comment']() == 1 end

tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- A few concrete environments---adapt as needed
-- equation environment detection 
tex_utils.in_equation = function() return tex_utils.in_env('equation') end

-- itemize environment detection
tex_utils.in_itemize = function() return tex_utils.in_env('itemize') end

-- TikZ picture environment detection
tex_utils.in_tikz = function() return tex_utils.in_env('tikzpicture') end

return tex_utils
