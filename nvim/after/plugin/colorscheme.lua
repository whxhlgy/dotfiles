vim.opt.termguicolors = true

-- sonokai 
-- vim.g.sonokai_style = 'andromeda'
-- vim.g.sonokai_better_performance = true

-- vim.cmd.colorscheme('sonokai')
--
-- tokyonight
require("tokyonight").setup({
  transparent = true,
  style = "moon",
})
vim.cmd "colorscheme xcodelighthc"
-- vim.g.tokyonight_dark_float = false
--
-- for transparent colorscheme
-- vim.cmd([[
-- hi TelescopeNormal guibg=none
-- hi TelescopeBorder guibg=none
-- hi FloatBorder guibg=none
-- hi NormalFloat guibg=none
-- hi LineNr guifg=#F0F8FF guibg=NONE
-- ]])
