local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
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
	--call dein#local('~/code/lua', {}, ['projectlaunch.nvim'])
	--"call dein#local('~/code/lua', {}, ['markdown-map.nvim'])
	--"call dein#add('sheodox/projectlaunch.nvim')
	--" call dein#add('sheodox/markdown-map.nvim')
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
