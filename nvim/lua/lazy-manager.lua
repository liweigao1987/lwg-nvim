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
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
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
-- init.lua:
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("plugin.telescope")
		end,
    },
{
		"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
},
		{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
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
			  'ahmedkhalf/project.nvim',
		config = function()
			require("plugin.project")
		end,
	},
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
    dashboard = { enabled = true },
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
	config = function ()
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
	config = function ()
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
}
})

