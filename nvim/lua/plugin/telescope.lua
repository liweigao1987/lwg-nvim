local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
})

pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "project")
pcall(telescope.load_extension, "file_browser")
