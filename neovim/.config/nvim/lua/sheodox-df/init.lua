-- install and load plugins with dein
require("sheodox-df.plugins")
-- general vim settings
require("sheodox-df.settings")
-- setup keybindings
require("sheodox-df.keymaps")

-- any augroup/autocmd
require("sheodox-df.autocommands")
-- plugin specific settings/setup for plugins with lots of settings
require("sheodox-df.plugin_settings.general")
require("sheodox-df.plugin_settings.nvim-cmp")
require("sheodox-df.plugin_settings.nvim-lsp")
require("sheodox-df.plugin_settings.nvim-treesitter")
require("sheodox-df.plugin_settings.formatter-nvim")
require("sheodox-df.plugin_settings.gitsigns")
