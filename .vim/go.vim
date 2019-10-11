" Go mappings
autocmd FileType go nmap <Leader>r :<C-u>GoRun %<CR>
autocmd FileType go nmap <Leader>d :<C-u>GoDoc<CR>
autocmd FileType go nmap <Leader>al :<C-u>GoAlternate<CR>
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_doc_popup_window = 1
let g:go_echo_go_info = 0
let g:go_metalinter_autosave=1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
