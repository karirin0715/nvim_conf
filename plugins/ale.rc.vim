let g:ale_sign_error = 'E➤'
let g:ale_sign_warning = 'W➤'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'normal'

let g:ale_linters = {
\   'html': [],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\}

let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'vue': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'json': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'less': ['prettier'],
\   'scss': ['prettier'],
\   'python': ['autopep8'],
\}

" let g:ale_fix_on_save = 1
