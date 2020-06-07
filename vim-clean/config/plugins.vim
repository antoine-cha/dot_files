" -------------------------------- "
" -------------------------------- "
" -----      Plugins         ----- "
" -------------------------------- "
" -------------------------------- "

call plug#begin()
" ------------------------- "
"       Basics
" ------------------------- "
" Shortcut to comment line for any filetype
Plug 'tpope/vim-commentary',
" Replace characters surrounding string
Plug 'tpope/vim-surround',
" Git toolkit
Plug 'tpope/vim-fugitive',
" Fancy status line
Plug 'bling/vim-airline',
" Vertical bars to show indent
Plug 'nathanaelkane/vim-indent-guides'
" Autoclose parentheses
Plug 'Raimondi/delimitMate'

" ------------------------- "
"       Tools
" ------------------------- "
Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf', { 'dir': '~/.local/src/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Snippets
Plug 'SirVer/ultisnips'

" ------------------------- "
"       Python
" ------------------------- "
" Plug 'ambv/black'
" Plug 'python-mode/python-mode'
" Plug 'zchee/deoplete-jedi',

" ------------------------- "
"       Folder browsing
" ------------------------- "
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' },
" Plug 'ryanoasis/vim-devicons'
" Plug 'HerringtonDarkholme/vim-nerdtree-syntax-highlight'

" ------------------------- "
"       Misc
" ------------------------- "
" Plug 'airblade/vim-gitgutter'
" Plug 'ap/vim-css-color'
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" Plug 'honza/vim-snippets',
" Plug 'lervag/vimtex'
" Plug 'lifepillar/pgsql.vim'
" Plug 'neomake/neomake'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'rust-lang/rust.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' },

call plug#end()

