-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Quick fix next" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Quick fix prev" })
