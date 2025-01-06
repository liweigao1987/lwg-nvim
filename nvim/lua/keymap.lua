-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n", "<leader>ft", ":NvimTreeToggle<CR>", opt)

-- bufferline
map("n", "<leader>bb", ":BufferLinePick<CR>", opt)
map("n", "<leader><TAB>", ":BufferLineGoToBuffer -1<CR>", opt)
-- 左右Tab切换
map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>bl", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<leader>bd", ":bdelete!<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opt)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

return pluginKeys
