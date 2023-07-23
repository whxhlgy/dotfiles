vim.opt.scrolloff=10

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.termguicolors=true

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<cr>")
vim.keymap.set("n", "<leader>t", ":tabnew<cr>")

vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.hlsearch = false
vim.opt.updatetime = 100

vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- automatically reload files when they change
vim.opt.autoread = true


-- limit the pop up window height
vim.opt.pumheight=10

-- vim.opt.foldnestmax = 1
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldlevel = 1

--
--neovide configuration
--
vim.opt.guifont='SF Mono:h14'
vim.g.neovide_remember_window_size = true

vim.g.neovide_input_macos_alt_is_meta =true
--
-- end neovide configuration
--
--
--
-- automatically reload files when they change
vim.cmd('set autoread | au CursorHold * checktime')

vim.cmd([[
autocmd FileType javascript,html,css,lua
  \ set tabstop=2 | set softtabstop=2 | set shiftwidth=2
]])

-- set sign-column always visible
vim.opt.signcolumn = "yes:1"

-- fixing neorg markup rendering error, which I dont know why and how
vim.opt.conceallevel = 3

-- color scheme
vim.opt.cursorline=true
