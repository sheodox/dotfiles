" treesitter spell checks code which gets annoying
" set spell

set nowrap
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120

set updatetime=300

set backspace=indent,eol,start

set number relativenumber
set tabstop=4
set shiftwidth=0

set diffopt=filler,iwhite

set list
set listchars=tab:›\ ,extends:›,precedes:‹,nbsp:·,trail:·,lead:.

set t_Co=256
set cursorline

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme sheodoxdark
set background=dark
hi NonText ctermfg=16 guifg=#4a4a59
hi CursorLine guibg=#2a2f3d gui=NONE cterm=NONE
