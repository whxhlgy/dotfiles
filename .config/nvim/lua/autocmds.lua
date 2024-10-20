-- Set up autocommand for showing line diagnostics on CursorHold
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
  end,
})

-- Set up autocommand for showing signature help on CursorHoldI
-- vim.api.nvim_create_autocmd('CursorHoldI', {
--   pattern = '*',
--   callback = function()
--     -- Using pcall to silently handle any errors
--     pcall(vim.lsp.buf.signature_help)
--   end,
-- })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('filetype_jsx', { clear = true }),
  pattern = 'javascript',
  command = 'set filetype=javascriptreact',
})
