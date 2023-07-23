return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
  --
  -- ######################
  -- ### EDITOR FEATURE ###
  -- ######################
  --
	-- repeat
	use("tpope/vim-repeat")
	-- commentary
	use("tpope/vim-commentary")
	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- surrounding replacement
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	-- autopair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	-- treesitter autotag: automatically close html tag
	use("windwp/nvim-ts-autotag")

  -- #########################
  -- ### EDITOR APPEARANCE ###
  -- #########################
  --
	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- treesitter context
	use("nvim-treesitter/nvim-treesitter-context")
	-- treesitter playground
	use("nvim-treesitter/playground")

	-- figitive, a git integration
	use("tpope/vim-fugitive")
	-- color schemes
	use("sainnhe/sonokai")
	use("folke/tokyonight.nvim")
  use("lunacookies/vim-colors-xcode")
	-- winbar
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
	})
	-- css color preview
	use("norcalli/nvim-colorizer.lua")

  -- ###################
  -- ### IDE FEATURE ###
  -- ###################
  --
  -- ### LSP ###
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })

	use("ray-x/lsp_signature.nvim")
	-- copilot
	use("github/copilot.vim")
	-- formatter
	use("mhartington/formatter.nvim")
	-- dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
        },
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
  -- git related
  -- notes: use 'C-w o' to quit git diff
  use("lewis6991/gitsigns.nvim")
end)
