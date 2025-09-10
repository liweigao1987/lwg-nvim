local status, luasnip = pcall(require, "luasnip")
if not status then
	vim.notify("no luasnip!!!")
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
