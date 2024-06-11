augroup vg_alone_ft
	au!
	autocmd BufNewFile,BufRead *.vg set syntax=vg
augroup END

augroup vg_mixed_ft
	au!
	autocmd BufNewFile,BufRead *.vg-* set syntax=vg
augroup END
