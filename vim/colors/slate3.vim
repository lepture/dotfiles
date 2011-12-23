" Vim color file
"
" Author: Hsiaoming Young <lepture@me.com>
" Version: 0.1
" Last Changed: Dec. 8 2011
" Note: Based on slate, run on Gui or 256-color-xterm
"
" if &t_Co > 255
"   colorscheme slate3
" endif

set background=dark
hi clear

let colors_name="slate3"

" Basic Layout {{{
hi Normal ctermbg=0 ctermfg=15 guibg=#181b1f guifg=#d0d0d0 gui=none
hi Cursor guibg=#c6e2ff guifg=#000000 gui=bold ctermfg=black ctermfg=lightblue
hi CursorLine guibg=#333333
hi CursorColumn guibg=#232323
hi FoldColumn guibg=#363d45 guifg=fg gui=none
hi Folded guibg=#48525d guifg=fg ctermfg=fg
hi LineNr guibg=#24292e guifg=#666666 ctermfg=250 ctermbg=234 cterm=none
hi NonText ctermfg=8 guibg=bg guifg=#878787 gui=bold
hi SignColumn guibg=#363d45 guifg=fg gui=none
hi StatusLine guibg=#9fb6cd guifg=#000000 ctermfg=black ctermbg=250
hi StatusLineNC guibg=#6c7b8b guifg=#000000
hi VertSplit ctermbg=7 ctermfg=0 guibg=#6c7b8b guifg=#6c7b8b gui=bold
hi Visual ctermbg=7 ctermfg=0 guibg=#8598ac guifg=#000000 gui=bold
hi VisualNOS guibg=bg guifg=#8598ac gui=bold,underline
hi WildMenu guibg=#cccccc guifg=#000000 gui=bold
" }}}

" Syntax {{{
hi Boolean guifg=#E23871 ctermfg=162
hi Number guifg=#E23871 ctermfg=162
hi String guifg=#E23871 gui=italic ctermfg=162
"hi Structure guibg=bg guifg=#8fe779 gui=none
hi Include guifg=#d7a0d7 ctermfg=140
hi Function guifg=#00d7af gui=bold ctermfg=43 cterm=bold
hi Keyword guifg=#00d7af gui=bold ctermfg=43 cterm=bold
"hi Orerator guibg=bg guifg=#7ec0ee gui=none
"hi Define ctermfg=45
hi Statement guibg=bg guifg=#7ec0ee ctermfg=39
hi Constant guibg=bg guifg=#d75fd7 ctermfg=170
hi Comment guifg=#617183 gui=italic ctermfg=darkgrey
hi Error guibg=bg guifg=#ee2c2c
"hi Exception guibg=bg guifg=#ee2c2c gui=none
hi Exception guibg=bg guifg=#7ec0ee ctermfg=39
hi Identifier guibg=bg guifg=#7ee0ce gui=none
hi Ignore guibg=bg guifg=#373737 gui=none
hi PreProc guifg=#d7a0d7 ctermfg=140
hi Special guifg=#e0c07e ctermfg=178
"hi SpecialChar guifg=#e0c07e
"hi Delimiter guifg=#e0c07e
hi StorageClass guibg=bg guifg=#7ec0ee ctermfg=39
hi Repeat guibg=bg guifg=#7ec0ee gui=none ctermfg=39
hi Todo guifg=#bbbb87 guibg=bg gui=bold,underline ctermfg=222 ctermbg=bg cterm=bold,underline
hi Type guifg=#f09479 ctermfg=208
hi Underlined guibg=bg guifg=#1e90ff gui=underline ctermbg=bg cterm=underline
hi Label guifg=#E6DB74 gui=none
" }}}

" Popup menu {{{
hi Pmenu guifg=#d0d0d0 guibg=#4e5964 gui=none ctermfg=252 ctermbg=237
hi PmenuSel guibg=#9fb6cd guifg=#000000 gui=none ctermfg=0 ctermbg=7
hi PmenuThumb guibg=#6c7b8b gui=none
" }}}

hi Directory guibg=bg guifg=#5fafff gui=none ctermfg=75
hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
hi DiffAdd guibg=#008b00 guifg=fg gui=none
hi DiffChange guibg=#00008b guifg=fg gui=none
hi DiffDelete guibg=#8b0000 guifg=fg gui=none ctermbg=1
hi DiffText guibg=#00008b guifg=fg gui=bold
hi IncSearch guibg=#e7e7e7 guifg=#000000 gui=bold
hi ModeMsg guibg=bg guifg=fg gui=bold
hi MoreMsg guibg=bg guifg=#d0d097 gui=bold
hi Question guibg=bg guifg=#e0c07e gui=bold
hi Search guibg=#2f4f4f guifg=NONE
hi SpecialKey guibg=bg guifg=#a28b5b gui=none
hi Title guibg=bg guifg=#e7e7e7 gui=bold
hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold

" Cursor {{{
hi lCursor guibg=fg guifg=bg gui=bold
"}}}

" HTML {{{
hi htmlBold cterm=bold gui=bold
hi htmlItalic cterm=none gui=italic
hi htmlUnderline cterm=underline gui=underline
hi htmlBoldItalic cterm=bold,italic gui=bold,italic
hi htmlBoldUnderline cterm=bold,underline gui=bold,underline
hi htmlBoldUnderlineItalic cterm=bold,underline,italic gui=bold,underline,italic
hi htmlUnderlineItalic cterm=underline,italic gui=underline,italic
" }}}

" showmarks plugin {{{
hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#6c8585    guifg=NONE
hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#538585    guifg=NONE 
" }}}
