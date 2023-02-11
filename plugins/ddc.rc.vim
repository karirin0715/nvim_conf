"↓　pum.vimの不具合(https://twitter.com/ShougoMatsu/status/1530845760560177152)
"があるためコメントアウト
"call ddc#custom#patch_global('completionMenu', 'pum.vim')

set winblend=20
hi Hoge guifg=#ffffff guibg=#333333
call pum#set_option('highlight_normal_menu', 'Hoge')

call ddc#custom#patch_global('sources', [
 \ 'vim-lsp',
 \ 'around',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'vim-lsp': {
 \   'mark': 'lsp', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ },
 \ 'around': {'mark': 'Around'
 \ }})
call ddc#custom#patch_filetype(['css', 'html'], {
       \ 'sourceParams': {
       \   'vim-lsp': {
       \     'ignoreCompleteProvider': v:true,
       \   },
       \ },
       \ })
inoremap <C-y> <Cmd>call pum#map#confirm()<CR>
inoremap <C-c> <Cmd>call pum#map#cancel()<CR>
inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>

autocmd CompleteDone * silent! pclose!

call ddc#enable()

