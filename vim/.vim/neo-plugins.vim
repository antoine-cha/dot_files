" -------- vim-polyglot --------
let g:polyglot_disabled = ['latex']

" -------- vimtex --------
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = { 'build_dir' : 'build' }

" -------- fzf --------
nnoremap <C-p> :FZF<Cr>
