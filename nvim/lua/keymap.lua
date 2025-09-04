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

map("n", "<leader>w/", ":vsp<cr>", opt)
map("n", "<leader>w-", ":sp<cr>", opt)
map("n", "<leader>wd", "<C-w>c", opt)
map("n", "<leader>wD", "<C-w>o", opt)
map("n", "<leader>wo", "<C-w>w", opt)
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
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fu', builtin.current_buffer_fuzzy_find, {})
map('n', '<leader>fw', function()
	builtin.grep_string({ search = vim.fn.expand("<cword>"), path = "%" })
end, {})
map('n', '<leader>pp', ":Telescope project<CR>", opt)


-- nvim-tree
map("n", "<leader>ft", ":NvimTreeToggle<CR>", opt)

-- bufferline
map("n", "<leader>bb", ":BufferLinePick<CR>", opt)
map("n", "<leader><TAB>", ":BufferLineGoToBuffer -1<cr>", opt)
-- 左右Tab切换
map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>bl", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<leader>bd", ":bdelete!<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opt)

-- nvim-window
local nvimWindow = require('nvim-window')
map('n', '<leader>ww', nvimWindow.pick, { desc = "window pick" })
-- map("n", "wo", ":lua require('nvim-window').pick()<CR>", opt)

-- flash
local flash = require('flash')
map({ 'n', 'x', 'o' }, 's', function() flash.jump() end, { desc = "flash" })
map({ 'n', 'x', 'o' }, 'S', function() flash.treesitter() end, { desc = "flash treesitter" })
map('o', 'r', function() flash.remote() end, { desc = "remote flash" })
map({ 'o', 'x' }, 'R', function() flash.treesitter_search() end, { desc = "treesitter search" })
map('c', '<C-s>', function() flash.toggle() end, { desc = "toggle flash search" })

-- multicursor
map('n', '<leader>se', ":MCstart<CR>", opt)

-- comment
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "<leader>cl", -- 行注释
		block = "<leader>cb", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "<leader>cl",
		block = "<leader>cb",
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
	mapbuf("n", "<leader>gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
	--[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
	mapbuf("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "<leader>gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "<leader>gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- mapbuf("n", "<leader>f", ":echo \"lwg\"<cr>", opt)
	mapbuf("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
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
