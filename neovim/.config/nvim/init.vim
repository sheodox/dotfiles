"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/sheodox/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/sheodox/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/sheodox/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
call dein#add('vim-airline/vim-airline')
call dein#add('morhetz/gruvbox')
call dein#add('evanleck/vim-svelte')
call dein#add('airblade/vim-gitgutter')
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

colorscheme gruvbox

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = [
			\'coc-json',
			\'coc-git',
			\'coc-tsserver',
			\'coc-css',
			\'coc-svelte',
			\'coc-html',
			\]


set number relativenumber
set tabstop=4
set shiftwidth=0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
