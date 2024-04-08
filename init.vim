if &compatible
	set nocompatible
endif

"----------------------------------------
" dein
"----------------------------------------
"deinはcacheにインストールする
"cache_dirはXDG Base Directory Specification対応を実施
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME 	"cache_home
let s:dein_dir = s:cache_home . '/dein' 											"deinのルート
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'				"dein本体のインストール先

"dein自体の自動インストール
if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif




"runtimepathの追加
let &runtimepath=s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	"普段はCommentout
	"tomlの修正時(pluginの削除時)、Uncomment
	""↓---------↓
  "call map(dein#check_clean(), "delete(v:val, 'rf')")
  "let g:dein#auto_recache = 1
	""↑---------↑

	" プラグインリストを収めた TOML ファイル
	" 予め TOML ファイルを用意しておく
	let g:rc_dir    = expand("~/.config/nvim/")
	let s:toml      = g:rc_dir . 'dein.toml'
	let s:lazy_toml = g:rc_dir . 'dein_lazy.toml'

	" TOML を読み込み、キャッシュしておく
	"call dein#add('Shougo/dein.vim')
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	"設定終了
	call dein#end()
	call dein#save_state()
endif

"プラグインの自動インストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"----------------------------------------
" terminal
"----------------------------------------
if has('nvim')
	" 新しいタブでターミナルを起動
	nnoremap @t :split:terminal<CR>
	" ESCでターミナルモードからノーマルモードへ
	tnoremap <ESC> <C-\><C-n>
	command! -nargs=* T split | wincmd j | terminal <args>
endif

"----------------------------------------
" ノーマルモードに戻る際にIMEoff
"----------------------------------------
if has('mac')
  set ttimeoutlen=1
  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
  augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
  augroup END
  noremap <silent> <ESC> <ESC>:call system(g:imeoff)<CR>
endif

"----------------------------------------
"Keymap
"----------------------------------------
"C-aのremap
nnoremap <C-a> <C-a>
cnoremap <C-a> <C-a>
"open NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"move buffer 
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
"xで消した文字をヤンクしない
nnoremap x "_x

"sv時のbd対応
command! Bd bp | sp | bn | bd
command! BD bp | sp |bn | bd!

"----------------------------------------
"Othere
"----------------------------------------
set number			""行NO表示
set nowrap			""折返禁止
set ignorecase		""検索時大文字小文字区別なし
set autochdir		""カレントディレクトリに自動移動
set iminsert=0		""InsertMode時に入力モードを半英
set imsearch=0		""検索時に入力モードを半英
set lines=40		""表示行数
set columns=180		""表示列数
set tabstop=2		""tab数=4
set shiftwidth=2	""自動インデント=4
set shortmess+=I	""nvimの開始時に挨拶メッセ時を非表示
set fenc=utf-8		""ファイルエンコードをutf-
set enc=utf-8		""エディタエンコードをutf-8
set clipboard=unnamed ""クリップボード操作可能に
set hidden			""編集注にBuffer移動可能に
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

set pumblend=10

"Colorscheme
set background=dark
colorscheme atom-dark-256
"colorscheme hybrid

"true colors
set termguicolors


"vue
augroup vueset
	autocmd!
	autocmd FileType vue syntax sync fromstart
augroup END


"LSP-Log
let g:denops_disable_version_check = 1
