local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>mf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ms', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

require('telescope').setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
	},
	pickers = {
		find_some = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})
