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

" nerdcommenter, toggle line with Ctrl + /
xnoremap <C-_> :call nerdcommenter#Comment('x', 'Toggle')<CR>

