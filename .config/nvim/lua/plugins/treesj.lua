return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  config = function()
    vim.keymap.set("n", "<leader>ms", require("treesj").split)
    vim.keymap.set("n", "<leader>mj", require("treesj").join)
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
