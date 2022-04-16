vim.cmd([[
let mapleader = ","

nnoremap <silent> <leader>t :NvimTreeFindFileToggle<CR>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" re-select the selection after indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" big movements
nnoremap <A-h> 10h
nnoremap <A-j> 10j
nnoremap <A-k> 10k
nnoremap <A-l> 10l

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
nnoremap <leader>gs :vertical G<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fgb <cmd>Telescope git_branches<cr>
nnoremap <leader>fgs <cmd>Telescope git_status<cr>
nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
" find files within the directory of the current file, good for finding
" related files to the file you're in when the file path is too long for the
" file tree to really be easy to see without closing your buffer's window
nnoremap <leader>fd <cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:h') })<cr>

" treesitter
nnoremap <silent> <leader>k :TSHighlightCapturesUnderCursor<CR>

" nerdcommenter, toggle line with Ctrl + /
xnoremap <C-_> :call nerdcommenter#Comment('x', 'Toggle')<CR>

" easy copy/paste
xnoremap <leader>c "+y
xnoremap <leader>p "+p

" quickfix list navigation
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>

" harpoon
nnoremap <leader>hf :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
" set a harpoon mark at the specified index
nnoremap <leader>h1 :lua require("harpoon.mark").set_current_at(1)<CR>
nnoremap <leader>h2 :lua require("harpoon.mark").set_current_at(2)<CR>
nnoremap <leader>h3 :lua require("harpoon.mark").set_current_at(3)<CR>
nnoremap <leader>h4 :lua require("harpoon.mark").set_current_at(4)<CR>
" open the harpoon menu
nnoremap <leader>hm :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <A-q><A-q> :qa!<CR>

" quit on :Q
command! Q quit

lua vim.keymap.set('n', "<leader>ll", require('projectlaunch').toggle_main_menu, {noremap = true, expr = false, buffer = false})
lua vim.keymap.set('n', "<leader>lf", require('projectlaunch').toggle_float, {noremap = true, expr = false, buffer = false})
lua vim.keymap.set('n', "<leader>ls", require('projectlaunch').toggle_split, {noremap = true, expr = false, buffer = false})
lua vim.keymap.set('n', "<leader>ln", require('projectlaunch').show_next, {noremap = true, expr = false, buffer = false})
lua vim.keymap.set('n', "<leader>lm", require('projectlaunch').show_prev, {noremap = true, expr = false, buffer = false})
lua vim.keymap.set('n', "<leader>lr", require('projectlaunch').restart_command_in_split, {noremap = true, expr = false, buffer = false})

lua vim.keymap.set('n', "<leader>md", require('markdownmap').toggle_map_menu, {noremap = true, expr = false, buffer = false})
]])
