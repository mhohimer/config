set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'taglist.vim'
Plugin 'autoload_cscope.vim'
Plugin 'scrooloose/nerdcommenter'

" colorschemes
Plugin 'Distinguished'
Plugin 'twilight256.vim'
Plugin 'wombat256.vim'
Plugin 'xoria256.vim'

"Plugin 'sirver/ultisnips'
"Plugin 'honza/vim-snippets'

"Python
Plugin 'nvie/vim-flake8'
Plugin 'indentpython.vim'
Plugin 'valloric/youcompleteme'

filetype plugin indent on

set mouse=a
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set incsearch
set hlsearch
set wrapscan
set number
set nowrap
set ignorecase
set smartcase

colo wombat256mod

" Use flake8 in python2
let g:flake8_cmd = 'python2-flake8'

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <F3> :YcmCompleter GoTo<CR>

vnoremap # :s/^/#/<cr>:noh<cr>
vnoremap -# : s/^#//<cr>:noh<cr>

fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace()
nnoremap <leader>w :TrimWhitespace
