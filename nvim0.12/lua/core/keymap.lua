local function mapkey(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { silent = true, nowait = true }, opts or {}))
end

local function mapcmd(key, cmd)
	vim.keymap.set("n", key, "<Cmd>" .. cmd .. "<CR>", { silent = true })
end

local function maplua(modes, key, action, desc)
	vim.keymap.set(modes, key, action, { silent = true, noremap = true, desc = desc })
end

vim.g.mapleader = " "
-- 保存和退出
mapkey({ "n", "x", "o" }, "S", ":wall<cr>")
mapkey({ "n", "x", "o" }, "Q", ":qall<cr>")
-- 折叠
mapkey({ "n", "x", "o" }, "<leader>o", "za")
mapkey("x", "<leader>o", "zf") -- 可视模式创造折叠

local function smart_select(ts_method, lsp_dir)
	return function()
		-- 如果当前不是普通文件（比如 Quickfix、帮助文档、终端等）那么我们直接发送一个原生的 <CR> 按键并退出，恢复回车原本的功能
		if lsp_dir == 1 and vim.bo.buftype ~= "" then
			local cr = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
			vim.api.nvim_feedkeys(cr, "n", false)
			return
		end
		if vim.treesitter.get_parser(nil, nil, { error = false }) then
			require("vim.treesitter._select")[ts_method](vim.v.count1)
		else
			vim.lsp.buf.selection_range(lsp_dir * vim.v.count1)
		end
	end
end
-- 扩大范围 (回车键)：不断向上寻找父节点 (等价于官方的 an)
maplua({ "x", "o", "n" }, "<CR>", smart_select("select_parent", 1), "扩大 Treesitter/LSP 范围")
-- 缩小范围 (退格键)：不断向下寻找子节点
maplua({ "x", "o" }, "<BS>", smart_select("select_child", -1), "缩小 Treesitter/LSP 范围")

-- 下面的函数给外部文件调用的
-- 使用示例如下
-- local map = require("core.keymap")
-- map:cmd('<space>p','PasteImg')
local map = {}
function map:key(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

function map:cmd(key, cmd)
	vim.keymap.set("n", key, "<Cmd>" .. cmd .. "<CR>", { silent = true })
end

function map:lua(key, txt_or_func)
	if type(txt_or_func) == "string" then
		vim.keymap.set("n", key, "<cmd>lua " .. txt_or_func .. "<cr>", { silent = true })
	else
		vim.keymap.set("n", key, txt_or_func, { silent = true })
	end
end

return map
