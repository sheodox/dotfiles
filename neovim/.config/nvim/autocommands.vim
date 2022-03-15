function WritingSettings()
	setlocal wrap
	setlocal textwidth=0
	setlocal spell
	" since wrap is on, use g to move by visual lines so moving in a large
	" block of text is easier to do.
	nnoremap <buffer> j gj
	nnoremap <buffer> k gk
endfunction

augroup enable_writing_settings
	autocmd!
	autocmd FileType markdown,gitcommit call WritingSettings()
augroup END

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.svelte,*.js,*.tsx,*.html,*.scss,*.css,*.json,*.yml,*.rb,*.md,*.go FormatWrite
augroup END

lua <<EOF
local function createBranch()
	vim.ui.input({prompt = "New branch name: "}, function(input)
		if input ~= nil then
			vim.cmd('Git checkout -b '..input)
		else
			print('No new branch created')
		end
	end)
end

local group = vim.api.nvim_create_augroup("FugitiveMenuSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", { pattern = "fugitive", callback = function()
	-- prompt to create and switch to a new branch
	vim.keymap.set('n', '<leader>gb', createBranch, {noremap = true, expr = false, buffer = true})
	-- push the current branch, even if it's not tracked on the remote
	-- https://github.com/tpope/vim-fugitive/issues/1272#issuecomment-747818629
	vim.keymap.set('n', '<leader>gp', '<cmd>Git -c push.default=current push<CR>', {noremap = true, buffer = true})
end})
EOF
