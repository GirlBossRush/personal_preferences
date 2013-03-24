
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
set wildignore+=*/tmp/*,*tmp/**,*.so,*.swp,*.zip,/vendor/bundle/**,server/**,*.sassc,*.scssc,*.cssc " MacOSX/Linux

source /home/eric/.vim/ohmyvim/ohmyvim.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" End of oh-my-vim required stuff

" Put your custom stuff bellow
colorscheme molokai
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

au BufNewFile,BufRead *.coffee set syntax=coffee
au BufNewFile,BufRead *.hamlc set syntax=haml

set nocompatible

nmap <F1> <Esc>:tabn<CR>
nmap <F2> <Esc>:tabp<CR>
nmap ,q   <Esc>:tabfirst<CR>
nmap ,r   <Esc>:tablast<CR>
nmap ,    <tab> <Esc>:tabs<CR>

set pastetoggle=<F3>

cmap w!! w !sudo tee % >/dev/null
nnoremap ; :

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

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
