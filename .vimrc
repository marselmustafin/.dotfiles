" Plugs <3
call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Common plugs
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'majutsushi/tagbar'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'vim-scripts/AutoComplPop'
Plug 'brooth/far.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'yegappan/mru'
Plug 'terryma/vim-multiple-cursors'
Plug 'mortonfox/nerdtree-clip'
Plug 'kchmck/vim-coffee-script'
Plug 'mileszs/ack.vim'
Plug 'M4R7iNP/vim-inky'
Plug 'vim-scripts/SearchComplete'
Plug 'airblade/vim-gitgutter'
" Plug 'ryanoasis/vim-devicons'

" ================ Ruby/Rails ======================
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'thoughtbot/vim-rspec'
Plug 'ruby-formatter/rufo-vim'
Plug 'jgdavey/vim-blockle'
Plug 'BlakeWilliams/vim-pry'
Plug 'KurtPreston/vim-autoformat-rails'
Plug 'vim-scripts/ruby-matchit'
Plug 'emilsoman/spec-outline.vim'
Plug 'ecomba/vim-ruby-refactoring'

" Python related
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'mgedmin/python-imports.vim'

call plug#end()

" VIM GENERAL CONFIG

set encoding=UTF-8
let mapleader = ',' " Remap <Leader> key
noremap <Leader>s :update<CR>
set number " Show line number
set mouse=a " Allow mouse
set scrolloff=5 " Lines below/above when scrolling or finding
set textwidth=100 " More symbols on the line
set t_Co=256 " Enable 256 colors if not enabled
set noshowmode " Disable show mode 'cause it duplicate with airline bar mode
filetype plugin indent on " Enable filetype detection
au FocusLost * silent! wa " Save on autofocus lost
color solarized8_dark " Colorsheme
set termguicolors
set guicursor+=n:hor20-Cursor/lCursor " Use horizontal cursor
set visualbell " Use visual bell (no beeping)
set relativenumber

set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set infercase
set incsearch " Searches for strings incrementally
set showmatch " Highlight matching brace

set autowriteall  " Auto-write all file changes
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showcmd
set hls! " toggle search higlighting
" Search visual selection
vnoremap // y/<C-R>"<CR>
" Swap current line and bottom line
map - ddp
" Swap current line and upper line
map _ kddpk
" \\ to navigate last to open files
nnoremap <leader><leader> <c-^>
set cuc cul " Highlight current column
nmap ; :
autocmd BufWritePre * %s/\s\+$//e " No trailing whitespaces
set hidden
set display+=lastline
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1
set splitright " Open new splits at the right side

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab " Insert spaces except tabs

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

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

" Open splits on the right and below
set splitbelow
set splitright

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
" Replace default tabs conf (MacOS specific)
nnoremap ˚ gt
nnoremap ∆ gT

" PLUGINS CONFIG

" Ruby debugger
nmap <leader>d :call pry#insert()<cr>

" FZF mapping
nnoremap <Leader>f :<C-u>FZF<CR>

" Ale plugin linters
let g:ale_linters = {
      \ 'ruby': ['rubocop', 'solargraph'],
      \ }

let g:ale_fixers = {
      \ 'ruby': ['rubocop', 'solargraph'],
      \ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" NERDTree configs
let NERDTreeShowHidden=1 " Show hidden files in NerdTree
let NERDTreeCascadeSingleChildDir=0 " Remove one-child dirs collapsing
" Shortcut for nerdtree tab toggle
map <C-s> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeStatusline = "%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeMinimalUI = 1
" permanent visibility on open and autoclose
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" prevent any opening files in NERDTree
autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction
let g:NERDTreeShowIgnoredStatus = 1

" RSpec.vim mappings
map <Leader>cs :call RunCurrentSpecFile()<CR>
map <Leader>ns :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>
map <Leader>as :call RunAllSpecs()<CR>
let g:rspec_command = "!bin/rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" Airline configs
let g:airline_highlighting_cache=1
let g:airline_powerline_fonts = 1

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2.7'
let g:pymode_python = 'python3'
let g:pymode_lint_on_fly = 1
let g:pymode_lint_signs = 0
let g:pymode_lint_cwindow = 0

" ctags configs
set tags=tags
set tags+=gems.tags

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Make Ack to work with the silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" For Gitgutter
set updatetime=100

" Spec Outline
let g:spec_outline_orientation = 'bottom'
