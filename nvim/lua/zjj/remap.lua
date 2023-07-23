vim.g.mapleader = " "
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)
vim.keymap.set("n", "g]", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "g[", function() vim.diagnostic.goto_prev() end)

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>fm", ':Format<CR>')
vim.keymap.set("n", "<F5>", ':UndotreeToggle<CR>')
