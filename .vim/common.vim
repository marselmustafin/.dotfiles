" VIM GENERAL CONFIG

set encoding=UTF-8
let mapleader = ',' " Remap <Leader> key
set number " Show line number
set relativenumber " Show relative line numbers
set mouse=a " Allow mouse
set scrolloff=5 " Lines below/above when scrolling or finding
set textwidth=100 " More symbols on the line
set noshowmode " Disable show mode 'cause it duplicate with airline bar mode
set t_Co=256 " Enable 256 colors if not enabled
filetype plugin indent on " Enable filetype detection
syntax enable
au FocusLost * silent! wa " Save on autofocus lost
color OceanicNext " Colorsheme
highlight Comment cterm=italic gui=italic
set termguicolors
set guicursor+=n:hor20-Cursor/lCursor " Use horizontal cursor
set visualbell " Use visual bell (no beeping)

set regexpengine=1
set noshowcmd
set synmaxcol=200

" Open splits on the right and below
set splitbelow
set splitright

set clipboard^=unnamed " Allow make yanks to system buffer
set hlsearch  " Highlight all search results
set hls! " Toggle search higlighting
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set infercase
set incsearch " Searches for strings incrementally
set showmatch " Highlight matching brace

set autowriteall  " Auto-write all file changes
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set noerrorbells
set cuc cul " Highlight current column
" nmap ; :
autocmd BufWritePre * %s/\s\+$//e " No trailing whitespaces
set hidden " Handle multiple buffers better.
set display+=lastline

" ================ Indentation ======================

set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab " Insert spaces except tabs

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

if has("autocmd")
  " set rxls filetype to ruby
  autocmd bufnewfile,bufread *.rxls set filetype=ruby

  " set es6 as javascript
  autocmd BufRead,BufNewFile *.es6 set filetype=javascript
endif

" Auto indent pasted text
noremap <Leader>s :write!<CR>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
nmap cp :let @* = expand("%")<CR>
" Search visual selection
vnoremap // y/<C-R>"<CR>
" Swap current line and bottom line
map - ddp
" Swap current line and upper line
map _ kddpk
" \\ to navigate last to open files
nnoremap <leader><leader> <c-^>

" =============== Splits ===========================

" Key remapping for handy tab switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q

" Remove arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Tabs
nnoremap TN :tabnew<CR>
nnoremap TQ :tabclose<CR>
nnoremap TE :tabe %<CR>
nnoremap TO <C-w>T
nnoremap <leader>c :cclose<CR>

" Replace default tabs shortcuts (MacOS specific)
nnoremap ˚ gt
nnoremap ∆ gT
nnoremap Y y$

if &synmaxcol == 3000
  " Lowering this improves performance in files with long lines.
  set synmaxcol=500
endif

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set completeopt-=preview
