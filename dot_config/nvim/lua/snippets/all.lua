-- " You're gonna ask where this came from....
-- " It comes from here:
-- " https://www.ejmastnak.com/tutorials/vim-latex/vimtex/
-- " You added this because you wanted to try LaTeX for math on nvim
return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "hi" },
    { t("Hello, world!") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),
}
