"--- NERDTree
"隠しファイル表示
let NERDTreeShowHidden=1
"引数で初期起動を制御
autocmd VimEnter * if !argc() | execute 'NERDTree' | endif
"他バッファを全て閉じた際に同時に閉じる
autocmd bufenter * if(winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

