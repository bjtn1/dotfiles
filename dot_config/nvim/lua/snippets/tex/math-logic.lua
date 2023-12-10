local utils = require("helpers.tex.utils")

return
  {
    s(
      {
        trig="tf",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \therefore<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="nmo",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \not\models<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="ent",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \models<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="land",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \land<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="lor",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \lor<>
        ]],
        {
          i(0),
        }
      ),
      {
        condition=utils.in_mathzone
      }
    ),

    s(
      {
        trig="not",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \neg<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="implies",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \implies<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    -- FIX this no work, doenst let me compile
    -- s(
    --   {
    --     trig="therefore",
    --     snippetType="autosnippet",
    --   },
    --   fmta(
    --     [[
    --     \therefore <>
    --     ]],
    --     {
    --       i(0),
    --     }
    --   ),
    --   {condition = utils.in_mathzone}
    -- ),

    s(
      {
        trig="exists",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \exists<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="forall",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \forall<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="iff",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \iff<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),

    s(
      {
        trig="equiv",
        snippetType="autosnippet",
      },
      fmta(
        [[
        \equiv<>
        ]],
        {
          i(0),
        }
      ),
      {condition = utils.in_mathzone}
    ),
  }
