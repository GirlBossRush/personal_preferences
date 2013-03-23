
" Added by oh-my-vim

" Change the default leader
" let mapleader = ","

" Skip upgrade of oh-my-vim itself during upgrades
" let g:ohmyvim_skip_upgrade=1

" Use :OhMyVim profiles to list all available profiles with a description
" let profiles = ['defaults', 'django', 'erl', 'friendpaste', 'git', 'makefile', 'map', 'pyramid', 'python', 'ranger', 'tmpl', 'utf8']
let profiles = ['defaults']

" Path to oh-my-vim binary (take care of it if you are using a virtualenv)
let g:ohmyvim="/home/eric/.oh-my-vim/env/bin/oh-my-vim"

" load oh-my-vim
source /home/eric/.vim/ohmyvim/ohmyvim.vim

" End of oh-my-vim required stuff

" Put your custom stuff bellow
colorscheme molokai
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

au BufNewFile,BufRead *.coffee set syntax=coffee
au BufNewFile,BufRead *.hamlc set syntax=haml

set nocompatible

set hidden
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set expandtab
set backspace=indent,eol,start "allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set smarttab      " insert tabs on the
set hlsearch      "highlight search terms
set incsearch     "show search matches as you type
set history=1000 " remember more commands and search history
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

set ignorecase
set smartcase
set incsearch

set equalalways

filetype on
filetype plugin on
filetype indent on


if &term =~ '^screen'
   " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
 endif

 set wildmode=longest,list,full
 set wildmenu
