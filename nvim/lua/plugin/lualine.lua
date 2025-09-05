local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

local function my_win_num()
	local icons = { '❶', '❷', '❸', '❹', '❺', '❻', '❼', '❽' }
	local win_num = vim.api.nvim_win_get_number(0)
	return icons[win_num] or tostring(win_num)
end

lualine.setup({
	options = {
		-- 指定皮肤
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
		theme = "tokyonight",
	},
	extensions = { "nvim-tree" },
	sections = {
		lualine_a = {
			{
				my_win_num,
			},
			{ 'mode' },
		},
		lualine_c = {
			"filename",
			{
				"lsp_progress",
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				-- symbols = {
				--   unix = '', -- e712
				--   dos = '', -- e70f
				--   mac = '', -- e711
				-- },
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"encoding",
			"filetype",
		},
	},
	inactive_sections = {
		lualine_a = {
			{
				my_win_num,
			}
		},
	},
})
