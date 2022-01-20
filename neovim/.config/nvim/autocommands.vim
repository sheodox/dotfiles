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

  "check node_modules/.bin, necessary for prettier it seems
"let g:neoformat_try_node_exe = 1
"augroup fmt
  "autocmd!
   "sbdchd/neoformat/issues/134
  "autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
"augroup END

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.svelte,*.js,*.tsx,*.html,*.scss,*.css,*.json,*.yml,*.rb,*.md,*.go FormatWrite
augroup END
