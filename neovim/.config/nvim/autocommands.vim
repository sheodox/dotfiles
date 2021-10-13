augroup wrap_sometimes
	autocmd!
	autocmd BufEnter COMMIT_EDITMSG,*.md setlocal wrap
	autocmd BufEnter COMMIT_EDITMSG,*.md setlocal textwidth=0
augroup END

"  check node_modules/.bin, necessary for prettier it seems
let g:neoformat_try_node_exe = 1
augroup fmt
  autocmd!
  " sbdchd/neoformat/issues/134
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

