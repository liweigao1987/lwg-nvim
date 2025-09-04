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
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			'nvimtools/hydra.nvim',
		},
		opts = {},
		cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
		keys = {
			{
				mode = { 'v', 'n' },
				'<Leader>m',
				'<cmd>MCstart<cr>',
				desc = 'Create a selection for selected text or word under the cursor',
			},
		},
	},
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
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("lsp.null-ls")
		end
	}
})
