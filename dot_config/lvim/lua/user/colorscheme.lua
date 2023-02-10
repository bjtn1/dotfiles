local colorscheme = "lunar"
local colorscheme_installed, _ = pcall(require, colorscheme)

if not colorscheme_installed then
  vim.notify("colorscheme " .. colorscheme .. " not found!") -- ".." is string concatenation operator
  return
end

lvim.colorscheme = colorscheme
