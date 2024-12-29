return {
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   opts = {
  --     css = {
  --       css = true,
  --     },
  --   },
  -- },
  -- { "brenoprata10/nvim-highlight-colors", opts = {
  --   enable_tailwind = true,
  -- } },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
      user_default_options = { hsl_fn = true, mode = "virtualtext", tailwind = true },
    },
  },
}
