let mapleader = ","

nnoremap <leader>t :NERDTreeToggle<CR>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" undotree
nnoremap <leader>ut :UndotreeToggle<CR>

" tabbing shortcuts
nnoremap <silent> <C-Left> :BufferPrevious<CR>
nnoremap <silent> <C-Right> :BufferNext<CR>
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <S-Tab> :BufferPrevious<CR>
nnoremap <silent> <C-q> :BufferClose<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" git fugitive magic command
nnoremap <leader>gs :G<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fgb <cmd>Telescope git_branches<cr>
nnoremap <leader>fgs <cmd>Telescope git_status<cr>

" treesitter
nnoremap <silent> <leader>k :TSHighlightCapturesUnderCursor<CR>

" nvim-compe
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" nerdcommenter, toggle line with Ctrl + /
xnoremap <C-_> :call nerdcommenter#Comment('x', 'Toggle')<CR>

