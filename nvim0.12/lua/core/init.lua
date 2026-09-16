vim.o.laststatus = 0
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = false
vim.o.wrap = true
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autochdir = true
vim.o.scrolloff = 4
vim.o.smartindent = true
vim.o.updatetime = 100
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.opt.updatetime = 200
vim.opt.iskeyword = "_,49-57,A-Z,a-z"
vim.o.winborder = 'rounded'
vim.o.swapfile = true
vim.o.undofile = true
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
-- 日志高亮关键字
vim.filetype.add({
	extension = { -- 后缀名
		log = "log",
		txt = function(path)
			if path:match(".*%.log") then
				return "log"
			end
			return "text"
		end,
	},
	filename = { -- 文件名
		["messages"] = "log",
		["syslog"] = "log",
	},
})
local log_group = vim.api.nvim_create_augroup("LogHighlighting", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = log_group,
	pattern = "log",
	callback = function()
		-- 这里的 fg 是十六进制颜色，你可以根据喜好调整
		vim.api.nvim_set_hl(0, "LogVersion", { fg = "#50FA7B", bold = true })
		vim.api.nvim_set_hl(0, "LogDownloaded", { fg = "#BD93F9" })
		vim.api.nvim_set_hl(0, "LogCompiling", { fg = "#F1FA8C" })
		vim.api.nvim_set_hl(0, "LogFinished", { fg = "#8BE9FD", bold = true })
		-- 清除旧的匹配，防止重复渲染卡顿
		for _, match in ipairs(vim.fn.getmatches()) do
			if match.group:find("^Log") then
				vim.fn.matchdelete(match.id)
			end
		end
		-- 版本号匹配
		vim.fn.matchadd("LogVersion", [[v\d\+\.\d\+\.\d\+]])
		-- \V 表示 "very nomagic"直接匹配字面量，\c 表示不区分大小写，\S* 匹配零个或多个“非空白”字符
		vim.fn.matchadd("LogDownloaded", [[\c\S*download\S*]])
		vim.fn.matchadd("LogCompiling", [[\VCompiling]])
		vim.fn.matchadd("LogFinished", [[\c\S*finish\S*]])
	end,
})

-- 开启高亮复制
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- 主题颜色
vim.cmd.colorscheme("catppuccin")
