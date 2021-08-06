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
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
call dein#add('vim-airline/vim-airline')
call dein#add('sheodox/sheodoxdark')
call dein#add('leafOfTree/vim-svelte-plugin')
call dein#add('airblade/vim-gitgutter')
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim')
call dein#add('preservim/nerdtree')
call dein#add('ryanoasis/vim-devicons')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('preservim/nerdcommenter')
call dein#add('editorconfig/editorconfig-vim')


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

let mapleader = ","
set spell

set updatetime=300
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

nnoremap <leader>t :NERDTreeToggle<CR>

" tabbing shortcuts
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :q<CR>

" git fugitive magic command
nnoremap <leader>gs :G<CR>

nnoremap <leader>f :GFiles<CR>


let g:coc_global_extensions = [
			\'coc-json',
			\'coc-git',
			\'coc-tsserver',
			\'coc-css',
			\'coc-svelte',
			\'coc-html',
			\'coc-solargraph',
			\'coc-angular',
			\]


set number relativenumber
set tabstop=4
set shiftwidth=0

set t_Co=256
set cursorline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
colorscheme sheodoxdark

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

