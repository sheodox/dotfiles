vim.cmd([[

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

" treesitter
nnoremap <silent> <leader>k :TSHighlightCapturesUnderCursor<CR>

" easy copy/paste
xnoremap <leader>c "+y
xnoremap <leader>p "+p

" quickfix list navigation
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>

nnoremap <A-q><A-q> :qa!<CR>

" quit on :Q
command! Q quit

" search for the visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
]])

local telescope = require("telescope.builtin")
local telescope_keymap_n = {
	["<leader>ff"] = function()
		telescope.git_files({ show_untracked = true })
	end,
	["<leader>F"] = function()
		telescope.resume()
	end,
	["<leader>fr"] = function()
		telescope.live_grep()
	end,
	["<leader>fb"] = function()
		telescope.buffers()
	end,
	["<leader>fh"] = function()
		telescope.help_tags()
	end,
	["<leader>fgb"] = function()
		telescope.git_branches()
	end,
	["<leader>fgs"] = function()
		telescope.git_status()
	end,
	["<leader>gr"] = function()
		telescope.lsp_references()
	end,
	-- find files within the directory of the current file, good for finding
	-- related files to the file you're in when the file path is too long for the
	-- file tree to really be easy to see without closing your buffer's window
	["<leader>fd"] = function()
		telescope.find_files({ cwd = vim.fn.expand("%:h") })
	end,
}

for mapping, fn in pairs(telescope_keymap_n) do
	vim.keymap.set("n", mapping, fn)
end

local projectlaunch = require("projectlaunch")
vim.keymap.set("n", "<leader>ll", projectlaunch.toggle_main_menu, { noremap = true, expr = false, buffer = false })
vim.keymap.set("n", "<leader>lf", projectlaunch.toggle_float, { noremap = true, expr = false, buffer = false })
vim.keymap.set("n", "<leader>ls", projectlaunch.toggle_split, { noremap = true, expr = false, buffer = false })
vim.keymap.set("n", "<leader>ln", projectlaunch.show_next, { noremap = true, expr = false, buffer = false })
vim.keymap.set("n", "<leader>lm", projectlaunch.show_prev, { noremap = true, expr = false, buffer = false })
vim.keymap.set(
	"n",
	"<leader>lr",
	projectlaunch.restart_command_in_split,
	{ noremap = true, expr = false, buffer = false }
)

vim.keymap.set(
	"n",
	"<leader>md",
	require("markdownmap").toggle_map_menu,
	{ noremap = true, expr = false, buffer = false }
)

-- harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local keymaps_n = {
	["<leader>hf"] = function()
		harpoon_mark.add_file()
	end,
	-- navigate directly to a file at the specified index
	["<leader>1"] = function()
		harpoon_ui.nav_file(1)
	end,
	["<leader>2"] = function()
		harpoon_ui.nav_file(2)
	end,
	["<leader>3"] = function()
		harpoon_ui.nav_file(3)
	end,
	["<leader>4"] = function()
		harpoon_ui.nav_file(4)
	end,
	--set a harpoon mark at the specified index
	["<leader>h1"] = function()
		harpoon_mark.set_current_at(1)
	end,
	["<leader>h2"] = function()
		harpoon_mark.set_current_at(2)
	end,
	["<leader>h3"] = function()
		harpoon_mark.set_current_at(3)
	end,
	["<leader>h4"] = function()
		harpoon_mark.set_current_at(4)
	end,
	-- open the harpoon menu
	["<leader>hm"] = function()
		harpoon_ui.toggle_quick_menu()
	end,
}

for mapping, fn in pairs(keymaps_n) do
	vim.keymap.set("n", mapping, fn)
end
