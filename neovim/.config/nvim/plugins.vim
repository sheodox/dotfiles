"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('neovim/nvim-lspconfig')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-path')
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('hrsh7th/cmp-cmdline')
call dein#add('onsails/lspkind-nvim')
call dein#add('hrsh7th/cmp-vsnip')
call dein#add('hrsh7th/vim-vsnip')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('sheodox/sheodoxdark')
call dein#add('airblade/vim-gitgutter')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('ThePrimeagen/harpoon')
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('kyazdani42/nvim-tree.lua')
call dein#add('ryanoasis/vim-devicons')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('preservim/nerdcommenter')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'})
call dein#add('nvim-treesitter/playground')
call dein#add('mattn/emmet-vim')
call dein#add('mbbill/undotree')
call dein#add('romgrk/barbar.nvim')
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('mhartington/formatter.nvim')
call dein#add('justinmk/vim-sneak')

" Required:
call dein#end()
"
" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

lua require'nvim-tree'.setup()
