-- " You're gonna ask where this came from....
-- " It comes from here:
-- " https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
-- " You added this because you wanted to try LaTeX for math on nvim
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node


-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
  ls.add_snippets("all", {
    s("hi", {
      t("HELLO!")
    })
  })
}
