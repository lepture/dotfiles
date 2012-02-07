" System
filetype off
call pathogen#infect()
call pathogen#helptags()
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
set autoread
set wildmenu
set ttyfast
set dictionary=/usr/share/dict/words
"set relativenumber
"set undofile
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=*.egg,*.egg-info
set wildignore+=*.orig
"set completeopt=preview
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %y,%P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
let MRU_File=$HOME . '/.hide/vim_mru_files'
let MRU_Include_Files='\.py$\|\.html$\|\.css$\|\.js$\|\.rst$'
let MRU_Auto_Close=1
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"set noswapfile
let g:pep8_cmd=$HOME . "/.virtualenv/lint/bin/pep8"
let g:syntastic_python_checker=$HOME . "/.virtualenv/lint/bin/flake8"
let g:syntastic_check_on_open=1
let loaded_html_syntax_checker = 0
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
autocmd FileType javascript setlocal smartindent
autocmd FileType html setlocal syntax=htmldjango
autocmd FileType css setlocal syntax=css3
au BufRead,BufNewFile *.vm set ft=html fileencoding=gbk syntax=velocity
au BufRead,BufNewFile *.j2 set ft=htmldjango

"map keys
let mapleader = ","
inoremap <C-U> <C-G>u<C-U>
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nnoremap ; :
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"gui setting
if has("gui_running")
  set guioptions=egmrLt
  set guifont=Monaco
  winsize 100 60
  set cursorcolumn
  set hidden
  colorscheme slate3
endif
if has("gui_macvim")
  "let macvim_skip_cmd_opt_movement=1
  menu disable &File.&Print
  map <D-p> <Plug>PeepOpen
  menu File.PeepOpen <Plug>PeepOpen
  map <D-[> :tabprevious<cr>
  map <D-]> :tabnext<cr>
endif

if &t_Co > 255
  colorscheme slate3
endif
