" Don't worry about vi compatibility. See :help nocompatible.
set nocompatible

" Syntax highlighting.
syntax on

" Setup Vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Set filetype indentation, pluging loading, and detection.
filetype indent plugin on

" Set undo persistence.
set undofile
set undodir=~/.vim/undofiles

" Set search lighlighting
set hlsearch

" Enable hidden buffers
set hidden

" Enable mouse
set mouse=a

" Quicker navigation between splits when in normal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open splits on the right and below
set splitbelow
set splitright

" Set expandtab, tabstop, shiftwidth, and textwidth
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=80

" Configure some F-buttons
nnoremap <F3> :set invpaste<Enter>
