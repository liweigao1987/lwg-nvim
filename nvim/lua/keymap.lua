-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
	noremap = true,
	silent = true,
}

-- 本地变量
local map = vim.keymap.set

map("i", "<C-h>", "<left>", opt)
map("i", "<C-j>", "<down>", opt)
map("i", "<C-k>", "<up>", opt)
map("i", "<C-l>", "<right>", opt)

map("n", "w/", ":vsp<cr>", opt)
map("n", "w-", ":sp<cr>", opt)
map("n", "wd", "<C-w>c", opt)
map("n", "wD", "<C-w>o", opt)
map("n", "wo", "<C-w>w", opt)
--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		-- 历史记录
		-- ["<Down>"] = "cycle_history_next",
		-- ["<Up>"] = "cycle_history_prev",
		-- 关闭窗口
		-- ["<esc>"] = actions.close,
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		-- ["<C-u>"] = "preview_scrolling_up",
		-- ["<C-d>"] = "preview_scrolling_down",
	},
	n = {
		["<C-c>"] = "close",
	},
}

-- nvim-tree
map("n", "ft", ":NvimTreeToggle<CR>", opt)

-- bufferline
map("n", "bb", ":BufferLinePick<CR>", opt)
map("n", "<leader><TAB>", ":BufferLineGoToBuffer -1<cr>", opt)
-- 左右Tab切换
map("n", "bh", ":BufferLineCyclePrev<CR>", opt)
map("n", "bl", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "bd", ":bdelete!<CR>", opt)
-- 关闭其他标签页
map("n", "bo", ":BufferLineCloseOthers<CR>", opt)

-- nvim-window
local nvimWindow = require('nvim-window')
map('n', 'ww', nvimWindow.pick, { desc = "window pick" })
-- map("n", "wo", ":lua require('nvim-window').pick()<CR>", opt)

local builtin = require('telescope.builtin')
map('n', 'ff', builtin.find_files, {})
map('n', 'fg', builtin.live_grep, {})
map('n', 'fb', builtin.buffers, {})
map('n', 'fh', builtin.help_tags, {})
map('n', '<leader>p', ":Telescope project<CR>", opt)

-- comment
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "cl", -- 行注释
		block = "cb", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "cl",
		block = "cb",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	--[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  --]]
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	--[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	--[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
	mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
	--[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- mapbuf("n", "<leader>f", ":echo \"lwg\"<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys
