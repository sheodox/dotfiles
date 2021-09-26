augroup wrap_sometimes autocmd!

	autocmd BufEnter COMMIT_EDITMSG,*.md setlocal wrap
	autocmd BufEnter COMMIT_EDITMSG,*.md setlocal textwidth=0
augroup END

