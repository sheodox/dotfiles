local util = require("sheodox-df.util")

-- allow the same config to work on machines with local clones of my own plugins,
-- without needing to clone them on all machines that use my dotfiles
local function use_local_if_exists(local_path, github_path)
	if util.path_exists(local_path) then
		return { local_path, dev = true }
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
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-cmdline",
	"onsails/lspkind-nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	"nvim-lua/plenary.nvim",
	"nvim-lualine/lualine.nvim",
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
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	"lewis6991/gitsigns.nvim",
	"lewis6991/spellsitter.nvim",
	"ThePrimeagen/harpoon",
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"kyazdani42/nvim-tree.lua",
	"ryanoasis/vim-devicons",
	"tpope/vim-fugitive",
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
	"editorconfig/editorconfig-vim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	"mattn/emmet-vim",
	{ "rrethy/vim-hexokinase", build = "make hexokinase" },

	"mbbill/undotree",
	"romgrk/barbar.nvim",
	"kyazdani42/nvim-web-devicons",
	"mhartington/formatter.nvim",
	"ggandor/lightspeed.nvim",
	"windwp/nvim-autopairs",
	"junegunn/goyo.vim",

	-- my plugins
	use_local_if_exists("~/code/lua/projectlaunch.nvim", "sheodox/projectlaunch.nvim"),
	use_local_if_exists("~/code/lua/markdown-map.nvim", "sheodox/markdown-map.nvim"),
})
