local M = {}

vim.cmd([[
" set spell
set nospell

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

let g:tokyonight_style="night"
colorscheme tokyonight
set background=dark
]])

function M.set_additional_highlights()
	-- make the background color on nvim-treesitter-context contrast more with the normal text
	vim.cmd("hi TreesitterContext guibg=#292e42")
end

M.set_additional_highlights()

return M
