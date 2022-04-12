require("nvim-tree").setup({ preserve_window_proportions = true })
require("gitsigns").setup()
require("spellsitter").setup()
require("nvim-autopairs").setup({})
require("projectlaunch").setup({ split_default_width = 80, split_focus_on_open = false })
require("lualine").setup()
require("harpoon").setup({
	menu = {
		width = math.min(vim.api.nvim_win_get_width(0) - 10, 140),
	},
})
