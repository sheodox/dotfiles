" install and load plugins with dein
runtime plugins.vim
" general vim settings
runtime settings.vim
" setup keybindings
runtime keymaps.vim

" any augroup/autocmd
lua require("autocommands")
" plugin specific settings/setup for plugins with lots of settings
lua require('plugin_settings/nvim-cmp')
lua require('plugin_settings/nvim-lsp')
lua require('plugin_settings/nvim-treesitter')
lua require('plugin_settings/formatter-nvim')
lua require('plugin_settings/gitsigns')

