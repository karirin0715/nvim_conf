call ddc#custom#patch_global({
\ 'ui': 'pum',
\	'sources': [
\		'vim-lsp',
\		'around',
\		'buffer',
\	],
\	'sourceOptions': {
\		'_': {
\			'matchers'  : ['matcher_fuzzy'],
\			'sorters'   : ['sorter_fuzzy'],
\			'converters': ['converter_fuzzy'],
\			'ignoreCase': v:true,
\		},
\		'around': {
\			'mark': '[Arround]',
\		},
\		'buffer': {
\			'mark': '[Buffer]',
\		},
\		'vim-lsp': {
\			'mark': '[LSP]',
\			'forceCompletionPattern': '\.\w*|:\w*|->\w*',
\		},
\	},
\	'sourceParams': {
\		'around': { 'maxSize': 500 },
\		'buffer': {
\			'limitBytes': 5000000,
\			'forceCollect': v:true,
\			'fromAltBuf': v:true,
\		},
\	 },
\})

call pum#set_option('auto_select', v:true)
call pum#set_option('padding', v:true)
call pum#set_option('border', "single")
call pum#set_option('preview', v:true)
call pum#set_option('preview_border', "single")
call pum#set_option('preview_delay', 250)
call pum#set_option('preview_width', 72)
call pum#set_option('scrollbar_char', "▋")
call pum#set_option('highlight_normal_menu', "Normal")
call pum#set_option('offset_cmdcol', 1)
call pum#set_option('offset_cmdrow', 2)

inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

call ddc#enable()
