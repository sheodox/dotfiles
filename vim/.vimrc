let mapleader = ","

set spell

set nowrap
set noerrorbells
set noswapfile
set nobackup
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
	let &t_ut=''
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set background=dark
hi Normal guibg=#1F1F28 guifg=#DCD7BA
hi SpellBad guibg=#1F1F28 cterm=undercurl
hi Identifier guifg=#7E9CD8
hi PreProc guifg=#E6C384
hi Comment guifg=#727169
hi Constant guifg=#98BB6C guibg=#1F1F28
hi Statement guifg=#FF5D62
hi Type guifg=#7AA89F
hi Special guifg=#957FB8
hi Underlined cterm=underline
hi Error guifg=#E82424
hi LineNr guifg=#54546D
hi CursorLineNr guifg=#54546D
hi CursorLine guibg=#363646 cterm=none
hi SpecialKey ctermfg=16 guifg=#3E3E3E " list chars
hi EndOfBuffer guifg=#1F1F28
hi SignColumn guibg=#1F1F28 

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

map <leader>k :call SynStack()<CR>
