set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'autoload_cscope.vim'
"Plugin 'cscope.vim'
Plugin 'indentpython.vim'
"Plugin 'pythoncomplete'
"Plugin 'python.vim'
"
" colorschemes
Plugin 'Distinguished'
Plugin 'twilight256.vim'
Plugin 'wombat256.vim'
Plugin 'xoria256.vim'

filetype plugin indent on

set incsearch
set hlsearch
set wrapscan
set number

colo wombat256mod
