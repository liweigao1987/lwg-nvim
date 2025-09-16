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

map({ 'i', 'c' }, "<C-h>", "<left>", opt)
map({ 'i', 'c' }, "<C-j>", "<down>", opt)
map({ 'i', 'c' }, "<C-k>", "<up>", opt)
map({ 'i', 'c' }, "<C-l>", "<right>", opt)
map({ 'i', 'c' }, "<C-a>", "<Home>", opt)
map({ 'i', 'c' }, "<C-e>", "<End>", opt)

map("n", "<leader>w/", ":vsp<cr>", opt)
map("n", "<leader>w-", ":sp<cr>", opt)
map("n", "<leader>wd", "<C-w>c", opt)
map("n", "<leader>wD", "<C-w>o", opt)
map("n", "<leader>wo", "<C-w>w", opt)
map("n", "<leader>0", ":0wincmd w <cr>", opt)
map("n", "<leader>1", ":1wincmd w <cr>", opt)
map("n", "<leader>2", ":2wincmd w <cr>", opt)
map("n", "<leader>3", ":3wincmd w <cr>", opt)
map("n", "<leader>4", ":4wincmd w <cr>", opt)
map("n", "<leader>5", ":5wincmd w <cr>", opt)
map("n", "<leader>6", ":6wincmd w <cr>", opt)
map("n", "<leader>7", ":7wincmd w <cr>", opt)
map("n", "<leader>8", ":8wincmd w <cr>", opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
-- pluginKeys.telescopeList = {
-- 	i = {
-- 		-- 上下移动
-- 		["<C-j>"] = "move_selection_next",
-- 		["<C-k>"] = "move_selection_previous",
-- 		-- 历史记录
-- 		["<C-n>"] = "cycle_history_next",
-- 		["<C-p>"] = "cycle_history_prev",
-- 		-- 关闭窗口
-- 		-- ["<esc>"] = actions.close,
-- 		["<C-c>"] = "close",
-- 	},
-- 	n = {
-- 		["<C-c>"] = "close",
-- 	},
-- }
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = "find files" })
map('n', '<leader>sp', builtin.live_grep, { desc = "project search" })
map('n', '<leader>bb', builtin.buffers, { desc = "list buffers" })
map('n', '<leader>fh', builtin.help_tags, { desc = "help tags" })
map('n', '<leader>fr', builtin.oldfiles, { desc = "recent files" })
map('n', '<leader>hc', builtin.commands, { desc = "search commands" })
map('n', '<leader>hch', builtin.command_history, { desc = "command history" })
map('n', '<leader>sh', builtin.search_history, { desc = "search history" })
map('n', '<leader>hh', builtin.man_pages, { desc = "man pages" })
map('n', '<leader>mm', builtin.marks, { desc = "list marks" })
map('n', '<leader>ho', builtin.vim_options, { desc = "search options" })
map('n', '<leader>rr', builtin.registers, { desc = "list registers" })
map('n', '<leader>hk', builtin.keymaps, { desc = "search keymap" })
map('n', '<leader>ji', builtin.current_buffer_tags, { desc = "buffer tags" })
map('n', '<leader>rl', builtin.resume, { desc = "resume pickers" })
map('n', '<leader>sl', builtin.pickers, { desc = "list pickers" })
map('n', '<leader>gc', builtin.git_commits, { desc = "git commits" })
map('n', '<leader>gb', builtin.git_branches, { desc = "git branches" })
map('n', '<leader>gs', builtin.git_status, { desc = "git status" })
map('n', '<leader>jd', ":Telescope file_browser<cr>", { desc = "file browser" })
map('n', '<leader>pp', ":Telescope project<CR>", opt)
map('n', '<leader>ss', ":Telescope current_buffer_fuzzy_find<cr>", opt)
map('n', '<leader>la', builtin.lsp_incoming_calls, { desc = "find icalls" })
map('n', '<leader>lb', ":Telescope lsp_dynamic_workspace_symbols <cr>", opt)
map('n', '<leader>ld', builtin.lsp_definitions, { desc = "find definitions" })
map('n', '<leader>lf', builtin.treesitter, { desc = "list treesitter" })
map('n', '<leader>li', builtin.lsp_implementations, { desc = "find implementations" })
map('n', '<leader>lo', builtin.lsp_outgoing_calls, { desc = "find ocalls" })
map('n', '<leader>lr', builtin.lsp_references, { desc = "find references" })
map('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "document symbols" })
map('n', '<leader>lt', builtin.lsp_type_definitions, { desc = "type definitions" })
map('n', '<leader>lw', builtin.lsp_workspace_symbols, { desc = "workspace symbols" })

-- nvim-tree
map("n", "<leader>ft", ":NvimTreeToggle<CR>", opt)

-- bufferline
map("n", "<leader>bj", ":BufferLinePick<CR>", opt)
map("n", "<leader><TAB>", ":b#<cr>", opt)
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
map({ 'n', 'x', 'o' }, '<leader>jj', function() flash.jump() end, { desc = "flash" })
map({ 'n', 'x', 'o' }, '<leader>jt', function() flash.treesitter() end, { desc = "flash treesitter" })
map('o', '<leader>jr', function() flash.remote() end, { desc = "remote flash" })
map({ 'o', 'x' }, '<leader>js', function() flash.treesitter_search() end, { desc = "treesitter search" })
map('c', '<C-s>', function() flash.toggle() end, { desc = "toggle flash search" })

-- multicursor
-- map('n', '<leader>se', ":MCstart<CR>", opt)
-- Lua 配置示例
local VM_leader = {
	default = "<leader>m", -- 默认模式前缀键
	visual = "<leader>m", -- 可视模式前缀键
	buffer = "<leader>m" -- 缓冲区局部前缀键
}
vim.g.VM_leader = VM_leader

map('n', '<leader>lr', "<cmd>lua vim.lsp.buf.rename()<cr>", opt)

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

--vim-table-mode
vim.g.table_mode_motion_right_map = '<tab>'
vim.g.table_mode_motion_left_map = '<S-tab>'

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
	-- mapbuf("n", "<leader>gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
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
	-- mapbuf("n", "<leader>gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	-- mapbuf("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	-- mapbuf("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- mapbuf("n", "<leader>f", ":echo \"lwg\"<cr>", opt)
	mapbuf("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys
