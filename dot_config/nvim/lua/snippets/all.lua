return
  {
    s(
      {
        trig="deet",
        snippetType="autosnippet",
      },
      fmta(
        [[
        <<details>>
          <<summary>><><</summary>>
          <<div>><><</div>>
        <</details>><>
        ]],
        {
          i(1),
          i(2),
          i(0),
        }
      ),
      {}
    ),

    s(
      {
        trig="sln",
        snippetType="autosnippet",
        dscr="showLineNumbers"
      },
      fmta(
        [[
          showLineNumbers<>
        ]],
        {
          i(0),
        }
      ),
      {
        -- condition=
      }
    ),
  }
-- return 
--   {
--     s(
--       {
--         trig="(",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--           (<>)<>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {
--         -- condition=
--       }
--     ),
--
--     s(
--       {
--         -- 
--         trig="[",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--           [<>]<>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {
--         -- condition=
--       }
--     ),
--
--     s(
--       {
--         trig="{",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--           {<>}<>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {
--         -- condition=
--       }
--     ),
--
--     s(
--       {
--         trig="\"",
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--           "<>"<>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {
--         -- condition=
--       }
--     ),
--
--     s(
--       {
--         trig="([^%a]))\'",
--         regTrig=true,
--         wordTrig=false,
--         snippetType="autosnippet",
--       },
--       fmta(
--         [[
--           '<>'<>
--         ]],
--         {
--           i(1),
--           i(0),
--         }
--       ),
--       {
--         -- condition=
--       }
--     )
--
--   }
