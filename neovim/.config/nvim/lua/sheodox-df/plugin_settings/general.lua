require("nvim-tree").setup({ view = { width = 50, preserve_window_proportions = true } })
require("gitsigns").setup()
require("spellsitter").setup()
require("nvim-autopairs").setup({})
require("lualine").setup()
require("treesitter-context").setup()

require("nvim-tree").setup({
	view = {
		adaptive_size = true,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
})

require("harpoon").setup({
	menu = {
		width = math.min(vim.api.nvim_win_get_width(0) - 10, 140),
	},
})

local projectlaunch = require("projectlaunch")
projectlaunch.setup({
	split_default_width = 80,
	split_focus_on_open = false,
})
