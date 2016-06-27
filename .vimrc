set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'taglist.vim'
Plugin 'autoload_cscope.vim'
"
" colorschemes
Plugin 'Distinguished'
Plugin 'twilight256.vim'
Plugin 'wombat256.vim'
Plugin 'xoria256.vim'

"Python
Plugin 'valloric/youcompleteme'
Plugin 'sirver/ultisnips'
Plugin 'nvie/vim-flake8'
Plugin 'indentpython.vim'

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set incsearch
set hlsearch
set wrapscan
set number

colo wombat256mod

" Use flake8 in python2
let g:flake8_cmd = 'python2-flake8'

