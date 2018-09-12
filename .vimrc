set nocompatible
syntax enable
behave xterm

" Keep tags file in $SRC, so this should work
set tags=$SRC/tag

" 4 space tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" insert comment macro
map  O/* 70i-o70i-a*/O	

