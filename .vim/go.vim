" Go mappings
autocmd FileType go nmap <Leader>r :<C-u>GoRun %<CR>
autocmd FileType go nmap <Leader>b :<C-u>GoBuild<CR>
autocmd FileType go nmap <Leader>d :<C-u>GoDoc<CR>
autocmd FileType go nmap <Leader>al :<C-u>GoAlternate<CR>
autocmd FileType go nmap <Leader>gC :<C-u>GoCoverageToggle<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_gopls_complete_unimported = 1
let g:go_gopls_use_placeholders = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"
let g:go_gorename_command = 'gopls'
" let g:go_doc_popup_window=1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_echo_go_info = 0

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
