local utils = require("helpers.tex.utils")

return {
  s(
    {
      trig = "sin",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \sin^{<>}\left(<>\right)<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = utils.in_mathzone }
  ),

  s(
    {
      trig = "cos",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \cos^{<>}\left(<>\right)<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = utils.in_mathzone }
  ),

  s(
    {
      trig = "tan",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \tan^{<>}\left(<>\right)<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = utils.in_mathzone }
  ),

  s(
    {
      trig = "cot",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \cot^{<>}\left(<>\right)<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = utils.in_mathzone }
  ),

  s(
    {
      trig = "sec",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \sec^{<>}\left(<>\right)<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = utils.in_mathzone }
  ),

  s(
    {
      trig = "csc",
      snippetType = "autosnippet"
    },
    fmta(
      [[
      \csc^{<>}\left(<>\right)<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    { condition = utils.in_mathzone }
  ),
}
