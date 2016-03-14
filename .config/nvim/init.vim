"Vundel
filetype off                " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
call vundle#begin('~/.config/nvim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required
filetype plugin indent on    " required

let g:python_host_prog = '/usr/bin/python2.7'
syntax on
set ruler
set nu 
set cursorline
set wildmenu
set lazyredraw
set showcmd
set autoread "Automatically reread files that have been changed externally
colorscheme jellybeans

" Clear trailing whitespace in selected file types on save
autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

"better up down on wrapped
nnoremap j gj
nnoremap k gk

"intends
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab 
set autoindent

"search
set nohlsearch
set incsearch
set ignorecase
set smartcase

"mapping
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

