require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/my_snippets"})

-- keymap
vim.keymap.set("n", "<leader>es", function ()
  require("luasnip.loaders").edit_snippet_files{
    format = function(file, source_name)
      if string.find(file, "/Users/zhongjunjie/.local/share/nvim/site/pack/packer/start/") then
        return nil
    else return file:gsub("/Users/zhongjunjie/.config/nvim/my_snippets/snippets", "$MYSNIP")
    end
  end,
  extend = function(ft, paths)
    if #paths == 0 then
      return {
        { "~/.config/nvim/my_snippets/" .. ft .. ".snippets",
          string.format("%s/%s.snippets", "~/.config/nvim/my_snippets", ft) }
      }
    end
    return {}
  end
  }
end)

vim.keymap.set("n", "<leader>eas", function ()
  require("luasnip.loaders").edit_snippet_files{
  }
end)
