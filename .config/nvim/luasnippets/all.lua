return {
  -- A simple "Hello, world!" text node
  s(
    {
      trig = 'hi',
    }, -- Table of snippet parameters
    { -- Table of snippet nodes
      t 'Hello,',
      i(1),
      t '!',
    }
  ),
  s({
    trig = 'zjj',
    snippetType = "autosnippet",
  }, {
    t '😍',
  }),
}
