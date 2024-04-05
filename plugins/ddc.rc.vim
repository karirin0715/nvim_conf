call ddc#custom#patch_global({
\	'ui': 'native',
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


call ddc#enable()
