local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline")
	return
end

bufferline.setup {
	options = {
		indicator = {
			icon = '▶',
			style = 'icon',
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "Tree",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			}
		},
		show_buffer_icons = false,
		show_close_icon = false,
		show_buffer_close_icons = false,
		show_tab_indicators = false,
	},
	highlights = {
		buffer = {
			fg = '#2E8B57',
		},
		buffer_visible = {
			fg = '#2E8B57',
		},
		buffer_selected = {
			fg = '#7CFC00',
			bold = true,
			italic = false
		},
		separator = {
			fg = '#000000',
		},
		separator_selected = {
			fg = '#000000',
		},
		separator_visible = {
			fg = '#000000',
		},
		offset_separator = {
			fg = '#000000',
		},
	},
}
