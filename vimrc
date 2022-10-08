" Set compatibility to Vim only.
set nocompatible
set nolist
set rnu
set number
set encoding=utf-8
set showcmd " show typed keys
set wrap
set hidden
set spell
setlocal spell spelllang=es
syntax on
filetype plugin indent on

" Turn off modelines
"set modelines=0

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=100
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
"set laststatus=2

" Display options
"set showmode
"set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>


" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}


" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

let mapleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'aklt/plantuml-syntax'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/emmet-vim'
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'


" ------------
"  EDIT VIMRC
" ------------
noremap <leader>c :tabedit ~/.vimrc<cr>
noremap <leader>so :w<cr>:so %<cr>:q<cr>


" -------------------
"  REMOVE ARROW KEYS
" -------------------
" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


" ----------
"  TERMINAL
" ----------
tnoremap ii <C-\><C-n>


" -------
" WINDOWS
" -------


" -------
"  NETRW
" -------
let g:netrw_banner=0          " disable banner
"let g:netrw_browse_split=4    " open inprior window
let g:netrw_altv=1            " open splits to the right
let g:netrw_liststyle=3       " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()


" -----------------
" FUZZY FILE FINDER
" -----------------
set path+=** "Make find command find inside directories recursively
set wildmenu
set wildmode=list:longest


" ----------
"  PLANTUML
" ----------
autocmd Filetype plantuml setlocal makeprg=java\ \-jar\ $HOME/.local/bin/plantuml.jar\ %


" --------
"   LSP
" --------
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_signs_enabled = 1
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> <leader>gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>gc :LspCodeAction quickfix<cr> 
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" --------------
"  ASYNCOMPLETE
" --------------
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <c-n> pumvisible() ? <c-n> : <c-n><c-n>
imap <c-space> <Plug>(asyncomplete_force_refresh)
" allow modifying the completeopt variable, or it will be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
