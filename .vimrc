set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
"Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'autoload_cscope.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'bling/vim-bufferline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'
Plugin 'takac/vim-hardtime'

" colorschemes
Plugin 'Distinguished'
Plugin 'twilight256.vim'
Plugin 'wombat256.vim'
Plugin 'xoria256.vim'
Plugin 'Zenburn'
Plugin 'Colortest'

"Plugin 'sirver/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'nvie/vim-flake8'

"Python
Plugin 'indentpython.vim'

filetype plugin indent on

let g:syntastic_python_python_exec = '/usr/bin/python3'

set mouse=a
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set incsearch
set hlsearch
set wrapscan
set number
set relativenumber
set nowrap
set ignorecase
set smartcase
set autoindent
"set smartindent
set clipboard=unnamed
set encoding=utf-8
set switchbuf=useopen
set ttimeoutlen=50

set list
set listchars=tab:>-

colo wombat256mod

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

"nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

nnoremap <leader>h :HardTimeToggle<CR>

fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace()
nnoremap <leader>w :TrimWhitespace


let g:ycm_autoclose_preview_window_after_completion=1
nmap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F3> :YcmCompleter GoTo<CR>

" airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='wombat256mod'

" auto-reload .vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end
