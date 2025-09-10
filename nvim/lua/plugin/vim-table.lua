local status, vtable = pcall(require, "vim-table-mode")
if not status then
	vim.notify("no vim-table-mode")
	return
end

vtable.setup({
	-- vim.g.table_mode_motion_right_map = '<tab>',
}) 
