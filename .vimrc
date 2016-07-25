"Vundel
filetype off                " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
call vundle#begin('~/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'peterhoeg/vim-qml'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
call vundle#end()            " required
filetype plugin indent on    " required
let g:python_host_prog = '/usr/bin/python2.7'

set laststatus=2 "for lightline
let g:lightline = {'colorscheme': 'jellybeans',}

"gvim stuff
if has('gui running')
    set guifont=Consolas:h12
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set lines=50 columns=100
endif

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
syntax on
set ruler
set nu
set cursorline
set wildmenu
set lazyredraw
set showcmd
set autoread "Automatically reread files that have been changed externally
colorscheme jellybeans

"better up down on wrapped
nnoremap j gj
nnoremap k gk

"intends
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent

"search
set nohlsearch
set incsearch
set ignorecase
set smartcase

"mapping
command F :%!astyle
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <F10> :NERDTreeToggle<CR>
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
nmap n nzz
nmap N Nzz
nmap { {zz
nmap } }zz
let mapleader = ","
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i
imap <leader>[ []<ESC>i

vnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>d "+d
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

nnoremap ' `

"sort block
nnoremap <Leader>so vip:sort<return>
