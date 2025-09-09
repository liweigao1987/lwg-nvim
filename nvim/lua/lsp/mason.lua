require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "bashls", "clangd" },
})
-- After setting up mason-lspconfig you may set up servers via lspconfig
local lspCfg = require("lspconfig")
local util = require 'lspconfig.util'

lspCfg.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {}
	},
	on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		-- 绑定快捷键
		require("keymap").mapLSP(buf_set_keymap)
	end,
}

-- lspCfg.clangd.setup {
-- 	cmd = {
-- 		"clangd",
-- 		"--header-insertion=never",
-- 		"--query-driver=/usr/bin/clang",
-- 		"--all-scopes=completion",
-- 		"--completion-style=detailed",
-- 	}
-- }
lspCfg.ccls.setup {
	-- on_attach = on_attach,
	on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		-- 绑定快捷键
		require("keymap").mapLSP(buf_set_keymap)
	end,
	-- 开启单文件支持
	single_file_support = true,
	-- 根目录获取规则
	root_dir = function(fname)
		return util.root_pattern('compile_commands.json', '.ccls')(fname) or util.find_git_ancestor(fname) or
		vim.fn.getcwd()
	end,
	-- 初始化参数
	init_options = {
		compilationDatabaseDirectory = "",
		cache = {
			directory = ".ccls-cache"
		},
		index = {
			threads = 32,
		},
		-- 需要读者定制化添加，有一些系统库并没有被 clang 默认索引
		-- 可通过 clang++ -v -E -x c++ - 查看默认的 include 路径
		clang = {
			extraArgs = {
				"-I/usr/include",
				"-I/usr/local/include",
				"-I/usr/include/c++/13",
			},
			resourceDir = ""
		}
	}
}
-- require("lspconfig").rust_analyzer.setup {}
