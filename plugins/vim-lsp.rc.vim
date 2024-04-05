" log setting
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

" vim-lsp option
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1

highlight link LspWarningHighlight Error
highlight link LspErrorHighlight Error

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}

" 定義ジャンプ(デフォルトのctagsによるジャンプを上書きしているのでこのあたりは好みが別れます)
nnoremap <F3> :<C-u>LspDefinition<CR>
" 定義情報のホバー表示
nnoremap K :<C-u>LspHover<CR>
"
" " 名前変更
" nnoremap <LocalLeader>R :<C-u>LspRename<CR>
" " 参照検索
" nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
" " Lint結果をQuickFixで表示
" nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
" " テキスト整形
" nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>
" " オムニ補完を利用する場合、定義の追加
" set omnifunc=lsp#complete
