-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'christoomey/vim-tmux-navigator' },

  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },

  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {
          config = { -- We added a `config` table!
            -- icon_preset = 'varied', -- And we set our option here.
          },
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
      },
    },
  },

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup {--[[ your config ]]
        ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,
      }
    end,
    keys = {
      { '<leader>mm', "<cmd>TSJToggle<cr>", desc = "[Treesj] toggle" },
      { '<leader>mj', "<cmd>TSJJoin<cr>", desc = "[Treesj] split" },
      { '<leader>ms', "<cmd>TSJSplit<cr>", desc = "[Treesj] join" }
    }
  },
}
