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
local map = vim.api.nvim_set_keymap

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
vim.keymap.set('n', 'ww', nvimWindow.pick, { desc = "window pick" })
-- map("n", "wo", ":lua require('nvim-window').pick()<CR>", opt)

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

return pluginKeys
