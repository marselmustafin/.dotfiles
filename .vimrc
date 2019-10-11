setglobal pastetoggle=<F2>

" Plugs <3

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Common plugs
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mortonfox/nerdtree-clip'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'rhysd/clever-f.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'mhartington/oceanic-next'
Plug 'w0rp/ale'
Plug 'brooth/far.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'janko/vim-test'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'google/vim-searchindex'

" ================ Ruby/Rails ======================
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'slim-template/vim-slim'
" Plug 'KurtPreston/vim-autoformat-rails'
Plug 'vim-scripts/ruby-matchit'
Plug 'emilsoman/spec-outline.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'BlakeWilliams/vim-pry'
Plug 'victormours/ruby-memoize.vim'

" Python related
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" JS and etc
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'M4R7iNP/vim-inky'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ekalinin/Dockerfile.vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

source ~/.vim/common.vim
source ~/.vim/nerdtree.vim
source ~/.vim/go.vim
source ~/.vim/python.vim

" PLUGINS CONFIG

" debugger insert
nmap <leader>d :call pry#insert()<cr>

" FZF mapping
nnoremap <Leader>f :<C-u>FZF<CR>
nnoremap <Leader>t :<C-u>Tags<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Ale plugin linters
let g:ale_linters = {
      \ 'ruby': ['rubocop', 'reek'],
      \ }

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rufo'],
      \ }

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_set_highlights = 1

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

nmap <Leader>ns :TestNearest<CR>
nmap <Leader>cs :TestFile<CR>
nmap <Leader>as :TestSuite<CR>
nmap <Leader>ls :TestLast<CR>
nmap <Leader>bs :TestVisit<CR>

" Airline configs
let g:airline_highlighting_cache=1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

" ctags configs
set tags=tags
set tags+=gems.tags

" Make Ack to work with the silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <Leader>a :Ack<Space>
noremap <Leader>A :Ack <cword><cr>
vnoremap <Leader>A y:Ack <C-r>=fnameescape(@")<CR><CR>

" Gitgutter icons updatetime
set updatetime=100

" Spec Outline
let g:spec_outline_orientation = 'bottom'

" Snippets
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Deoplete config
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('tabnine', 'rank', 50)
call deoplete#custom#option('max_list', 20)
call deoplete#custom#option('omni_patterns', {
      \ 'go': '[^. *\t]\.\w*',
      \})

let g:fzf_action = {
\ 'ctrl-t' : 'tab split',
\ 'ctrl-s' : 'split',
\ 'ctrl-v' : 'vsplit',
\}

let test#strategy = {
\ 'nearest' : 'neovim',
\ 'file' : 'neovim',
\ 'suite' : 'basic',
\}

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
