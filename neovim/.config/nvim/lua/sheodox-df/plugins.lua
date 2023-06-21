local util = require("sheodox-df.util")

-- allow the same config to work on machines with local clones of my own plugins,
-- without needing to clone them on all machines that use my dotfiles
local function use_local_if_exists(local_path, github_path)
	if util.path_exists(local_path) then
		return { dir = local_path }
	end
	return github_path
end

require("lazy").setup({
	-- the colorscheme should be available when starting Neovim
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",
	"onsails/lspkind-nvim",
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	"saadparwaiz1/cmp_luasnip",
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
		},
	},
	"folke/trouble.nvim",
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	},
	"nvim-lua/plenary.nvim",
	"nvim-pack/nvim-spectre",
	"nvim-lualine/lualine.nvim",
	"christoomey/vim-tmux-navigator",
	{ "echasnovski/mini.nvim", version = false },
	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup({
				messages = {
					enabled = false,
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- copied from LazyVim because I couldn't get it to load properly
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	"sindrets/diffview.nvim",
	"lewis6991/gitsigns.nvim",
	"lewis6991/spellsitter.nvim",
	"ThePrimeagen/harpoon",
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"kyazdani42/nvim-tree.lua",
	"ryanoasis/vim-devicons",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	"mattn/emmet-vim",
	{ "rrethy/vim-hexokinase", build = "make hexokinase" },

	"mbbill/undotree",
	"romgrk/barbar.nvim",
	"kyazdani42/nvim-web-devicons",
	"mhartington/formatter.nvim",
	"windwp/nvim-autopairs",

	-- my plugins
	use_local_if_exists("~/code/lua/projectlaunch.nvim", "sheodox/projectlaunch.nvim"),
	use_local_if_exists("~/code/lua/markdown-map.nvim", "sheodox/markdown-map.nvim"),
})
