" Added by oh-my-vim

" Change the default leader
let mapleader = ","

" Skip upgrade of oh-my-vim itself during upgrades
" let g:ohmyvim_skip_upgrade=1

" Use :OhMyVim profiles to list all available profiles with a description
" let profiles = ['defaults', 'django', 'erl', 'friendpaste', 'git', 'makefile', 'map', 'pyramid', 'python', 'ranger', 'tmpl', 'utf8']
let profiles = ['defaults']

" Path to oh-my-vim binary (take care of it if you are using a virtualenv)
let g:ohmyvim="/home/eric/.oh-my-vim/env/bin/oh-my-vim"

" End of oh-my-vim required stuff

" load oh-my-vim
source /home/eric/.vim/ohmyvim/ohmyvim.vim

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.sassc,*.scssc,*.cssc
set wildignore+=*.so,*.swp,*.zip

" CTRL-P
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Open files in new tabs.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

colorscheme molokai
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Syntax highlighting
au BufNewFile,BufRead *.coffee set syntax=coffee
au BufNewFile,BufRead *.hamlc set syntax=haml
au BufNewFile,BufRead *.md set syntax=markdown
au BufNewFile,BufRead *.slim set syntax=slim

set nocompatible

" Annoyances
noremap <F1> <nop>
inoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
noremap <silent> <c-l> :nohls<cr><c-l>
ino <C-C> <Esc>

nnoremap ; :
noremap U <C-r>

" Don't continue comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Traditional Save
noremap ss :update<CR>
noremap <C-S> <C-C>:update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-C>:update<CR>

" Traditional Quit
noremap qq :quit<CR>

" Remove that banner
set shortmess+=I

" Backspace past insert
set backspace=indent,eol,start

" Move into blankspace
set virtualedit=block

" Yank like Delete
nnoremap Y y$

set linebreak

set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Tabs
nmap <F1> <Esc>:tabp<CR>
nmap <F2> <Esc>:tabn<CR>
nmap w <Esc>:tabp<CR>
nmap e <Esc>:tabn<CR>

inoremap <F1> <Esc>:tabp<CR>
inoremap <F2> <Esc>:tabn<CR>

" Comment lines
map <C-/> :TComment<cr>
vmap <C-/> :TComment<cr>gv

" Movement
map <C-Up> <Home>
map <C-Down> <End>

imap <C-Up> <Home>
imap <C-Down> <End>


set pastetoggle=<F3>

cmap w!! w !sudo tee % >/dev/null

" Bubble single lines
map <C-S-Up> <Esc>ddkP<CR>ki
map <C-S-Down> <Esc>ddp<CR>ki
imap <C-S-Up> <Esc>ddkP<CR>ki
imap <C-S-Down> <Esc>ddp<CR>ki


" Bubble multiple lines
vmap <C-S-Up> xkP`[V`]
vmap <C-S-Down> xp`[V`]

set tabstop=2     " a tab is two spaces
set nowrap        " don't wrap lines
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

set cursorline

" Markdown corrections
augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" Allow buffers to exist in the background without being in a window.
set hidden

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

" silent !mkdir ~/.vim/backups > /dev/null 2>&1
" set undodir=~/.vim/backups
" set undofile

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
  function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

