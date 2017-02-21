" set UTF-8 encoding
" reminiz => rc19
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4 " tab width is 4 spaces
set expandtab " expand tabs to spaces
set softtabstop=4
set shiftwidth=4 " indent also with 4 spaces
filetype indent on
" Remove useless spaces at the end of the line
autocmd BufWritePre * %s/\s\+$//e
" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
"set textwidth=120
set colorcolumn=120
" turn syntax highlighting on
set t_Co=256
syntax on
" turn line numbers on
set number
" highlight matching braces
set showmatch
" Highlight current line
set cursorline
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Highlight search pattern where found
set hlsearch
" Start searching on the first key stroke
set incsearch
"" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"" Use jk to escape (as it is closer)
inoremap jk <Esc>
" Fold code based on indent
set foldmethod=indent
" Change indentation for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
" HTML filetpye detection with ext (remove problems with templates)
au BufReadPost *.html set filetype=html
" Override s3cfg filetype
au! BufNewFile,BufRead *.s3cfg setf dosini
" Binding for lnext and lprev to jump to errors
map <F3> :lprev <CR>
map <F4> :lnext <CR>
" Exec current script with Pytohn using F1
map <F1> :!python %:p <enter>

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
syntax enable
" PostgreSQL syntax by default
let g:sql_type_default = 'pgsql'
" Enable italics
set t_ZH=[3m
set t_ZR=[23m
" Reformat the current file with YAPF
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>h


"---------------------------------------
"--------------- PLUGINS ---------------
"---------------------------------------
execute pathogen#infect()

"--------------- python-mode ---------------
call pathogen#helptags()
filetype plugin indent on
let g:pymode_virtualenv = 0
let g:pymode_options_max_line_length = 119
" " Folding can cause lag
" " Especially in Python, set the fold to match indent (default is syntax)
let g:pymode_folding = 0
let g:pymode_rope = 0
" " Disable syntax checking with python-mode
let g:pymode_lint = 0

"--------------- syntastic ---------------
" Recommended defaults
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_loc_list_height = 5
nnoremap <leader>c :w<Cr>:SyntasticCheck<Cr>
" Python checker
let g:syntastic_python_checkers = ['pylint']


"--------------- vim-airline -------------
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" Powerline --------
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

"--------------- indent-guides -----------
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=53
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

"--------------- YouCompleteMe -----------
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_key_list_previous_completion = []
set completeopt-=preview

"--------------- NERDTree -----------
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py', 109, 'none', 109, 'none')
call NERDTreeHighlightFile('npy', 109, 239, 109, 'none')
call NERDTreeHighlightFile('pyc', 239, 'none', 109, 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')

"--------------- Markdown-preview -----------
let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1

"--------------- CtrlP -----------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"--------------- vim-mutliple-cursors -----------
" let g:multi_cursor_quit_key=''
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
" Exit insert mode with jk, then exit multicursor mode with q
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_quit_key='q'
let g:multi_cursor_insert_maps={'j':1}

