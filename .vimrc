set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE SETUP
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable

" Set tab width to 2 columns
set tabstop=2
" Use 2 columns for indentation
set shiftwidth=2
" Use spaces when pressing <tab> key
set expandtab

set number
" colorscheme shine
