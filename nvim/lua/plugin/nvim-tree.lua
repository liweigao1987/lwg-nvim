local is_ok, nvim_tree = pcall(require, "nvim-tree")
if not is_ok then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

local function my_on_attach(bufnr)
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
end

nvim_tree.setup({
	sort_by = "case_sensitive",
	-- project plugin 需要这样设置
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	on_attach = my_on_attach,
	renderer = {
		group_empty = true,
		root_folder_label = ":t",
		icons = {
			git_placement = "signcolumn",
			glyphs = {
				git = {
					unstaged = "⊛",
					staged = "⊜",
					unmerged = "",
					renamed = "⊘",
					untracked = "⊕",
					deleted = "⊖",
					ignored = "⊗",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	diagnostics = {
		enable = false,
	},
})
