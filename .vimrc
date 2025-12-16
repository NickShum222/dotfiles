set nocompatible
filetype off
syntax on

"call plug#begin('~/.vim/plugged')
"
"Plug 'junegunn/fzf',
"Plug 'srcery-colors/srcery-vim'
"call plug#end()

" General
set number
set relativenumber
set cursorline
set encoding=utf-8
set linebreak
set showtabline=0

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Smart Indenting
set smartindent
set autoindent

set ignorecase " Ignore case when searching
set smartcase " unless uppercase is used

set hlsearch " Highlight matches
set incsearch " Show matches as im typing

set undofile " persistent undo
set showcmd " show command at the bottom

set termguicolors
set laststatus=2 " always show status line

colorscheme habamax

let mapleader = " "
nnoremap - :Explore<CR>
