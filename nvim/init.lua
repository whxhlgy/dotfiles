require("zjj")

-- 解决treesitter下载慢
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
	config.install_info.url = config.install_info.url:gsub("https://gitclone.com/github.com/", "something else")
end

