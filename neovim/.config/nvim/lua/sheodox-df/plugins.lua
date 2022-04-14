local fn = vim.fn
local util = require("sheodox-df.util")
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if not util.path_exists(install_path) then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- allow the same config to work on machines with local clones of my own plugins,
-- without needing to clone them on all machines that use my dotfiles
local function use_local_if_exists(local_path, github_path)
	if util.path_exists(local_path) then
		return local_path
	end
	return github_path
end

require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use("lewis6991/impatient.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-cmdline")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use("nvim-lua/plenary.nvim")
	use("nvim-lualine/lualine.nvim")
	use("folke/tokyonight.nvim")
	use("lewis6991/gitsigns.nvim")
	use("lewis6991/spellsitter.nvim")
	use("ThePrimeagen/harpoon")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("kyazdani42/nvim-tree.lua")
	use("ryanoasis/vim-devicons")
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("preservim/nerdcommenter")
	use("editorconfig/editorconfig-vim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("romgrk/nvim-treesitter-context")
	use("nvim-treesitter/playground")
	use("mattn/emmet-vim")
	use({ "rrethy/vim-hexokinase", run = "make hexokinase" })

	use("mbbill/undotree")
	use("romgrk/barbar.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("mhartington/formatter.nvim")
	use("ggandor/lightspeed.nvim")
	use("windwp/nvim-autopairs")
	use("junegunn/goyo.vim")

	-- my plugins
	use(use_local_if_exists("~/code/lua/projectlaunch.nvim", "sheodox/projectlaunch.nvim"))
	use(use_local_if_exists("~/code/lua/markdown-map.nvim", "sheodox/markdown-map.nvim"))

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
