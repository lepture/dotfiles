" System
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Github bundles
"Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-markdown"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "tpope/vim-surround"
"Bundle "pangloss/vim-javascript"
Bundle "lepture/vim-javascript"
Bundle "ervandew/supertab"
Bundle "lepture/vim-velocity"
Bundle "scrooloose/syntastic"
Bundle "mattn/zencoding-vim"
Bundle "wavded/vim-stylus"
Bundle "shemerey/vim-peepopen"
Bundle "msanders/snipmate.vim"
Bundle "altercation/vim-colors-solarized"
Bundle "Lokaltog/vim-powerline"

"vim.org bundles
Bundle "jQuery"

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
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"set noswapfile
let g:syntastic_check_on_open=1
let loaded_html_syntax_checker = 0
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_auto_loc_list=1


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


"filetype plugin on
filetype plugin indent on
au BufRead,BufNewFile *.less set ft=css
autocmd FileType text setlocal textwidth=80
autocmd FileType python setlocal textwidth=79
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal smartindent
autocmd FileType html setlocal syntax=htmldjango smartindent
autocmd FileType css setlocal syntax=css3
au BufRead,BufNewFile *.vm set ft=html fileencoding=gbk syntax=velocity
au BufRead,BufNewFile *.j2 set ft=htmldjango
au BufRead,BufNewFile jquery.*.js set syntax=jquery

"map keys
let mapleader = ","
inoremap <C-U> <C-G>u<C-U>
",m -> fix dos ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nnoremap ; :
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

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
