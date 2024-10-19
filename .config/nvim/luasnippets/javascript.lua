return {
  s(
    { trig = 'imre' }, -- Table of snippet parameters
    { -- Table of snippet nodes
      t "import React from 'react';",
    }
  ),

  s(
    { trig = 'hd' },
    fmt(
      [[
/*
 * @description {}
 * @author Junjiezh
 * @copyright Intel 2024
 */
      ]],
      { i(1, 'description') }
    )
  ),

}
