" System
set nocompatible
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
set smarttab
set expandtab
set listchars=tab:>-
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
set autoread
set wildmenu
set wildignore+=*.pyc
"set completeopt=preview
set directory=$HOME/.hide
let g:netrw_home=$HOME . '/.hide'
let g:netrw_list_hide='.*\.swp$,.*\.pyc$,.*~'
let NERDTreeBookmarksFile=$HOME . '/.hide/bookmarks'
let NERDTreeShowBookmarks=1
"let NERDTreeHijackNetrw=0
"let g:netrw_altv=1
"let g:netrw_browse_split=4
let MRU_File=$HOME . '/.hide/vim_mru_files'
let MRU_Include_Files='\.py$\|\.html$\|\.css$\|\.js$\|\.rst$'
let MRU_Auto_Close=1
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
"set noswapfile

" tabs
retab
set tabpagemax=7
set showtabline=2
nmap <C-n> :tabnext<cr>
nmap <C-p> :tabprevious<cr>
nmap tn :tabnew .<cr>
nmap tc :tabclose<cr>
nmap <tab> :NERDTreeToggle<cr>

syntax on


"filetype plugin on
filetype plugin indent on
autocmd FileType text setlocal textwidth=80
autocmd FileType python setlocal textwidth=79
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal smartindent
autocmd FileType html setlocal syntax=htmldjango
autocmd FileType css setlocal syntax=css3
au BufRead,BufNewFile *.vm set ft=html fileencoding=gbk syntax=velocity
au BufRead,BufNewFile *.j2 set ft=htmldjango

inoremap <C-U> <C-G>u<C-U>

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"gui setting
if has("gui_running")
  set guioptions=egmrLt
  set guifont=Monaco
  winsize 100 60
  set cursorcolumn
  colorscheme slate3
endif

if &t_Co > 255
  colorscheme slate3
endif
