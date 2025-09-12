local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--{
	--  "loctvl842/monokai-pro.nvim",
	--  config = function()
	--    require("monokai-pro").setup()
	--  end
	--},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		--	config = function()
		--			require("plugin.flash")
		--		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {}
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("plugin.telescope")
		end,
	},
	{
		"LinArcX/telescope-env.nvim"
	},
	{
		"nvim-telescope/telescope-ui-select.nvim"
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		'nvim-telescope/telescope-project.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"onsails/lspkind-nvim",
		"tami5/lspsaga.nvim"
	},
	{
		"folke/lua-dev.nvim"
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("plugin.nvim-cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugin.nvim-tree")
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("plugin.lualine")
		end,
	},
	{
		"arkav/lualine-lsp-progress"
	},
	-- {
	-- 	'ahmedkhalf/project.nvim',
	-- 	config = function()
	-- 		require("plugin.project")
	-- 	end,
	-- },
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				pane_gap = 20,
				preset = {
					header = [[
 __
/  |
$$ |       __   __   __   ______
$$ |      /  | /  | /  | /      \
$$ |      $$ | $$ | $$ |/$$$$$$  |
$$ |      $$ | $$ | $$ |$$ |  $$ |
$$ |_____ $$ \_$$ \_$$ |$$ \__$$ |
$$       |$$   $$   $$/ $$    $$ |
$$$$$$$$/  $$$$$/$$$$/   $$$$$$$ |
                        /  \__$$ |
                        $$    $$/
                         $$$$$$/
]]
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1 },
					{ section = "startup", padding = { 0, 2 } },
					{ pane = 2, section = "header" },
					{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
				},
			},
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("plugin.bufferline")
		end
	},
	{
		"yorickpeterse/nvim-window",
		config = true
	},
	-- {
	-- 	"smoka7/multicursors.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		'nvimtools/hydra.nvim',
	-- 	},
	-- 	opts = {},
	-- 	cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
	-- 	keys = {
	-- 		{
	-- 			mode = { 'v', 'n' },
	-- 			'<Leader>m',
	-- 			'<cmd>MCstart<cr>',
	-- 			desc = 'Create a selection for selected text or word under the cursor',
	-- 		},
	-- 	},
	-- },
	{
		'numToStr/Comment.nvim',
		config = function()
			require("plugin.comment")
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("plugin.surround")
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require("plugin.autopairs")
		end
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugin.treesitter")
		end
	},
	{
		"mhartington/formatter.nvim"
	},
	-- {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	dependencies = { 'nvim-lua/plenary.nvim' },
	-- 	config = function()
	-- 		require("lsp.null-ls")
	-- 	end
	-- },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- {
	-- 	'kaymmm/bullets.nvim',
	-- 	opts = {
	-- 		colon_indent = true,
	-- 		delete_last_bullet = true,
	-- 		empty_buffers = true,
	-- 		file_types = { 'markdown', 'text', 'gitcommit' },
	-- 		line_spacing = 1,
	-- 		mappings = true,
	-- 		outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom', 'std*', 'std-', 'std+' },
	-- 		renumber = true,
	-- 		alpha = {
	-- 			len = 2,
	-- 		},
	-- 		checkbox = {
	-- 			nest = true,
	-- 			markers = ' .oOx',
	-- 			toggle_partials = true,
	-- 		},
	-- 	}
	-- },
	{
		"dhruvasagar/vim-table-mode",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("plugin.luasnip")
		end
	},
	{ "rafamadriz/friendly-snippets" },
	-- {
	-- 	"jake-stewart/multicursor.nvim",
	-- 	branch = "1.0",
	-- 	config = function()
	-- 		require("plugin.multicursor")
	-- 	end
	-- },
	{
		'mg979/vim-visual-multi',
		branch = "master"
	},
	{
		"anuvyklack/hydra.nvim",
	},
	-- {
	-- 	"tpope/vim-markdown",
	-- 	config = function()
	-- 		-- tpope/vim-markdown
	-- 		vim.g.markdown_syntax_conceal = 0
	-- 		vim.g.markdown_fenced_languages =
	-- 		{ "html", "python", "bash=sh", "json", "java", "js=javascript", "sql", "yaml", "xml",
	-- 			"Dockerfile", "Rust", "javascript", 'lua' }
	-- 	end,
	-- },
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = function() vim.fn["mkdp#util#install"]() end,
	-- }
})
