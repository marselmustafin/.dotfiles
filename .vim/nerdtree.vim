" NERDTree configs

let NERDTreeShowHidden=1 " Show hidden files in NerdTree
let NERDTreeCascadeSingleChildDir=0 " Remove one-child dirs collapsing
" Shortcut for nerdtree tab toggle
nnoremap  <C-s> :NERDTreeToggle<CR>
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
