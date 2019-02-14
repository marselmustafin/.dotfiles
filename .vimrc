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
" Plug 'ryanoasis/vim-devicons'

" Ruby/Rails related
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'thoughtbot/vim-rspec'
Plug 'ruby-formatter/rufo-vim'
Plug 'jgdavey/vim-blockle'
Plug 'BlakeWilliams/vim-pry'

" Python related
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'mgedmin/python-imports.vim'

call plug#end()

" VIM GENERAL CONFIG

let mapleader = ',' " Remap <Leader> key
noremap <Leader>s :update<CR>
set number " Show line number
set mouse=a " Allow mouse
set scrolloff=5 " Lines below/above when scrolling or finding
set textwidth=100 " More symbols on the line
set t_Co=256 " Enable 256 colors if not enabled
set noshowmode " Disable show mode 'cause it duplicate with airline bar mode
filetype plugin indent on " Enable filetype detection
au FocusLost User :wa " Save on autofocus lost
color dracula " Colorsheme
set termguicolors
set guicursor+=n:hor20-Cursor/lCursor " Use horizontal cursor
set visualbell " Use visual bell (no beeping)

set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set infercase
set incsearch " Searches for strings incrementally

set showmatch " Highlight matching brace
set expandtab " Insert spaces except tabs
set tabstop=2 " Number of spaces per Tab
set shiftwidth=2 " Number of auto-indent spaces

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

augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Key remapping for handy tab switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
map <C-n> :NERDTreeToggle<CR> " Shortcut for nerdtree tab toggle
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeMinimalUI=1
" permanent visibility on open and autoclose
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" RSpec.vim mappings
map <Leader>cs :call RunCurrentSpecFile()<CR>
map <Leader>ns :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bin/rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" function! MyMode()
"   let fname = expand('%:t')
"   return fname == '__Tagbar__' ? 'Tagbar' :
"         \ fname == 'ControlP' ? 'CtrlP' :
"         \ fname == '__Gundo__' ? 'Gundo' :
"         \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
"         \ fname =~ 'NERD_tree' ?  NERDTreeStatusline():
"         \ &ft == 'unite' ? 'Unite' :
"         \ &ft == 'vimfiler' ? 'VimFiler' :
"         \ &ft == 'vimshell' ? 'VimShell' :
"         \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

" Airline configs
let g:airline_highlighting_cache=1
let g:airline_powerline_fonts = 1

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2.7'
let g:pymode_python = 'python3'
let g:pymode_lint_on_fly = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_cwindow = 0

set tags=tags
set tags+=gems.tags
