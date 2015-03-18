" System
set nocompatible
filetype off
set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Github bundles
Plugin 'lepture/vim-javascript'
Plugin 'lepture/vim-css'
Plugin 'lepture/vim-jinja'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jnwhiteh/vim-golang'
Plugin 'airblade/vim-gitgutter'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'

call vundle#end()
"filetype plugin on
filetype plugin indent on

set backspace=indent,eol,start
set nobackup
set history=50
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp936,gbk
set ff=unix

" Options
"set paste
set ruler
set showcmd
set incsearch
set ignorecase
set smartcase
set gdefault
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
"set shiftround
set nu
set mouse=a
set vb t_vb=
set autoindent
set laststatus=2
set cmdheight=1
"set smartindent
set cursorline
"set cursorcolumn
set colorcolumn=+1
set autoread
set wildmenu
set ttyfast
set dictionary=/usr/share/dict/words
"set relativenumber
"set undofile
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
"set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=*.egg,*.egg-info
set wildignore+=*.orig
"set completeopt=preview

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %y,%P
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"configurations
set directory=$HOME/.hide
let g:netrw_home=$HOME . '/.hide'
let g:netrw_list_hide='.*\.swp$,.*\.pyc$,.*~'
let NERDTreeBookmarksFile=$HOME . '/.hide/bookmarks'
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
"let NERDTreeHijackNetrw=0
"let g:netrw_altv=1
"let g:netrw_browse_split=4
let g:html_indent_inctags = "body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"set noswapfile


" syntastic configuration
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args = "--ignore=E127"
let g:syntastic_javascript_jshint_args = "--config ".$HOME."/.vim/conf/jshintrc"
let g:syntastic_javascript_checkers = ['jshint']
let loaded_html_syntax_checker = 0


" tabs
retab
set tabpagemax=7
set showtabline=2
nmap <c-n> :tabnext<cr>
nmap <c-p> :tabprevious<cr>
nmap tn :tabnew .<cr>
nmap tc :tabclose<cr>
nmap <tab> :NERDTreeToggle<cr>

syntax on


au BufRead,BufNewFile *.less set ft=css
autocmd FileType text setlocal textwidth=80
autocmd FileType python setlocal textwidth=79 shiftwidth=4
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal smartindent ts=2 sw=2
autocmd FileType html setlocal sw=2 ts=2
autocmd FileType jinja setlocal sw=2 ts=2
autocmd FileType yaml setlocal sw=2 ts=2
autocmd FileType go setlocal noexpandtab
au BufRead,BufNewFile *.md set ft=markdown

"map keys
let mapleader = ","
inoremap <C-U> <C-G>u<C-U>
",m -> fix dos ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nnoremap ; :
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

set background=dark
let g:solarized_visibility='low'
"gui setting
if has("gui_running")
  set guioptions=egmrLt
  set guifont=Monaco
  winsize 100 60
  set cursorcolumn
  set hidden
  colorscheme solarized
else
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  colorscheme solarized
endif

"PeepOpen
if has("gui_macvim")
  "delete print menu
  unmenu File.Print
  map <D-p> <Plug>PeepOpen
  menu File.&PeepOpen <Plug>PeepOpen
endif
