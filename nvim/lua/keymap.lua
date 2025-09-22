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

map({ 'i', 'c' }, "<C-h>", "<Left>", { desc = "left" })
map({ 'i', 'c' }, "<C-j>", "<Down>", { desc = "down" })
map({ 'i', 'c' }, "<C-k>", "<Up>", { desc = "up" })
map({ 'i', 'c' }, "<C-l>", "<Right>", { desc = "right" })
map({ 'i', 'c' }, "<C-a>", "<Home>", { desc = "line head" })
map({ 'i', 'c' }, "<C-e>", "<End>", { desc = "line end" })
map({ 'i', 'c' }, "<M-w>", "<C-o>w", { desc = "jump word forward" })
map({ 'i', 'c' }, "<M-b>", "<C-o>b", { desc = "jump word back" })
map({ 'i', 'c' }, "<M-h>", "<BS>", { desc = "del char left" })
map({ 'i', 'c' }, "<M-l>", "<Del>", { desc = "del char right" })
map({ 'i', 'c' }, "<M-d>", "<C-o>dw", { desc = "del word right" })
map({ 'i', 'c' }, "<M-k>", "<C-o>D", { desc = "del line end" })
map({ 'i', 'c' }, "<M-/>", "<C-o>u", { desc = "undo" })

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

map("n", "<leader>fs", ":w<cr>", { desc = "file save" })
map("n", "<leader>fS", ":wa<cr>", { desc = "files save" })
--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

--treewalker
-- movement
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<cmd>Treewalker Up<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<cmd>Treewalker Down<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<cmd>Treewalker Left<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<cmd>Treewalker Right<cr>', { silent = true })

-- swapping
vim.keymap.set('n', '<C-S-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
vim.keymap.set('n', '<C-S-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
vim.keymap.set('n', '<C-S-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
vim.keymap.set('n', '<C-S-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })

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
map('n', '<leader>fF', ":Telescope dir find_files<cr>", { desc = "dir files" })
map('n', '<leader>sp', builtin.live_grep, { desc = "project search" })
map('n', '<leader>sP', builtin.grep_string, { desc = "cursor project search" })
map('n', '<leader>sd', ":Telescope dir live_grep<cr>", { desc = "dir search" })
map('n', '<leader>bb', builtin.buffers, { desc = "list buffers" })
map('n', '<leader>hh', builtin.help_tags, { desc = "help tags" })
map('n', '<leader>fr', builtin.oldfiles, { desc = "recent files" })
map('n', '<leader>hc', builtin.commands, { desc = "search commands" })
map('n', '<leader>hch', builtin.command_history, { desc = "command history" })
map('n', '<leader>sl', builtin.search_history, { desc = "search history" })
map('n', '<leader>hm', builtin.man_pages, { desc = "man pages" })
map('n', '<leader>mm', builtin.marks, { desc = "list marks" })
map('n', '<leader>ho', builtin.vim_options, { desc = "search options" })
map('n', '<leader>rr', builtin.registers, { desc = "list registers" })
map('n', '<leader>hk', builtin.keymaps, { desc = "search keymap" })
map('n', '<leader>ji', builtin.current_buffer_tags, { desc = "buffer tags" })
map('n', '<leader>rl', builtin.resume, { desc = "resume pickers" })
map('n', '<leader>sc', builtin.pickers, { desc = "list pickers" })
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
map("n", "<leader><TAB>", ":b#<cr>", { desc = "switch buffer" })
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

-- flash
local flash = require('flash')
map({ 'n', 'x', 'o' }, '<leader>jj', function() flash.jump() end, { desc = "flash" })
map({ 'n', 'x', 'o' }, '<leader>jt', function() flash.treesitter() end, { desc = "flash treesitter" })
map('o', '<leader>jr', function() flash.remote() end, { desc = "remote flash" })
map({ 'o', 'x' }, '<leader>js', function() flash.treesitter_search() end, { desc = "treesitter search" })
map('c', '<C-s>', function() flash.toggle() end, { desc = "toggle flash search" })

-- multicursor
-- map('n', '<leader>se', ":MCstart<CR>", opt)
local VM_leader = {
	default = "<leader>m", -- 默认模式前缀键
	visual = "<leader>m", -- 可视模式前缀键
	buffer = "<leader>m" -- 缓冲区局部前缀键
}
vim.g.VM_leader = VM_leader

--toggleterm
map("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "terminal" })
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "float terminal" })

--snacks
map("n", "<leader>ts", function() Snacks.terminal() end, { desc = "snacks terminal" })
map("n", "<leader>tS", function() Snacks.terminal(nil, { win = { position = "float" } }) end, { desc = "snacks fterm" })

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
map("n", "<leader>tm", ":TableModeToggle<CR>", { desc = "toggle visual mode" })
vim.g.table_mode_motion_right_map = '<tab>'
vim.g.table_mode_motion_left_map = '<S-tab>'

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "<leader>gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	mapbuf("n", "<leader>==", ":lua vim.lsp.buf.format()<CR>", opt)
	mapbuf("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
end

-- vim-highlighter
vim.cmd([[
   let HiSet   = '<leader>so'
   let HiErase = '<leader>sr'
   let HiClear = '<leader>sO'
   let HiFind  = '<leader>sf'
   let HiSetSL = '<leader>sh'
     " jump key mappings
  nn n <Cmd>call HiSearch('n')<CR>
  nn N <Cmd>call HiSearch('N')<CR>

  " :noh commmand mapping, if there isn't
  nn <leader>sq <Cmd>noh<CR>
 ]])

return pluginKeys
