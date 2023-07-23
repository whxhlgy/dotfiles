vim.cmd [[highlight Search guibg=#818497 gui=bold]]
require('lsp_signature').setup({
  hi_parameter = 'Search',
  hint_enable = false,
  handler_opts = {
    border = 'rounded',
  },
})
