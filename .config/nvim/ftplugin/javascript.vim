" JavaScript specific filetype settings
"
" Neomake
let g:neomake_open_list=0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" gutentags
let g:gutentags_project_info = []
call add(g:gutentags_project_info, { 'type': 'javascript', 'file': 'package.json' })
let g:gutentags_project_root = ['package.json']
let g:node_modules_dirs = []
let g:gutentags_file_list_command = 'find . -type f -iregex ".*\.\(js\|vue\)$" -not -path "./node_modules/*"'
""let g:gutentags_ctags_executable_javascript = $PWD .'/node_modules/.bin/jsctags'
"let g:gutentags_ctags_executable_javascript = $PWD .'/gen_jsctags.sh'
""let g:gutentags_ctags_extra_args = ['./node_modules/.bin/jsctags', 'tags.files']
