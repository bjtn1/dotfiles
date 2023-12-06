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

------------------------ .tex SNIPPETS --------------------------------
ls.add_snippets("tex", {
  s({trig="tt", dscr="Expands 'tt' into '\text{}'"},
    {
      t("\\text{"), -- remember: backslashes need to be escaped
      i(1),
      t("}"),
    }
  ),
  s({trig="text", dscr="Expands 'text' into '\text{}'"},
    {
      t("\\text{"), -- remember: backslashes need to be escaped
      i(1),
      t("}"),
    }
  ),
  -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
  -- there is a much better, human-readable solution: ls.fmt, described shortly.
  s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
    {
      t("\\frac{"),
      i(1),  -- insert node 1
      t("}{"),
      i(2),  -- insert node 2
      t("}")
    }
  ),
  s({trig="frac", dscr="Expands 'frac' into '\frac{}{}'"},
    {
      t("\\frac{"),
      i(1),  -- insert node 1
      t("}{"),
      i(2),  -- insert node 2
      t("}")
    }
  ),
})
