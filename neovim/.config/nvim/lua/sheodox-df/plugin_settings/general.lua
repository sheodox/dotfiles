require("nvim-tree").setup({ view = { width = 50, preserve_window_proportions = true } })
require("gitsigns").setup()
require("spellsitter").setup()
require("nvim-autopairs").setup({})
require("lualine").setup()
require("treesitter-context").setup()
require("spectre").setup()

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
	paths = "./lua/sheodox-df/plugin_settings/snippets/",
})

-- mini.nvim plugins
require("mini.ai").setup()
require("mini.indentscope").setup()
local animate = require("mini.animate")
local fast_timing = {
	timing = animate.gen_timing.cubic({ duration = 100, unit = "total" }),
}

animate.setup({
	cursor = fast_timing,
	scroll = fast_timing,
	resize = fast_timing,
	open = fast_timing,
	close = fast_timing,
})

-- mason
require("mason").setup()
require("mason-lspconfig").setup()

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
