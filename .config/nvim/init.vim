" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" === start ncm2 stuff ===
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'

" based on ultisnips
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
" ===== end ncm2 stuff ===

" === start helpers ===
Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim'
Plug 'neomake/neomake'
" ===== end helpers ===

" === start managers ===
"Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/vimfiler.vim'
Plug 'ludovicchabant/vim-gutentags'
" ===== end managers ===

" === start editing ===
Plug 'tpope/vim-surround'
" ===== end editing ====

" Initialize plugin system
call plug#end()

let g:python3_host_prog = "/home/krzy0s/python/.neovim/venv/bin/python"

" Built in function mappings
set hidden
set confirm
set autoindent
set splitbelow
set splitright
set nu

set background=dark

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Tab> <C-W>
nnoremap <S-Tab> <C-W>W

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <C-b> :b <C-Z>

nnoremap <C-b>r :bp\|bd #<CR>
"nnoremap <C-b>d :bd<CR>
nnoremap <C-b>e DeleteEmptyBuffers()<CR>
nnoremap <C-e> :e<space>
nnoremap <C-s> :so %<CR>
map <esc> :noh<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>
nnoremap <M-1> :1b<CR>
nnoremap <M-2> :2b<CR>
nnoremap <M-3> :3b<CR>
nnoremap <M-4> :4b<CR>
nnoremap <M-5> :5b<CR>
nnoremap <M-6> :6b<CR>
nnoremap <M-7> :7b<CR>
nnoremap <M-8> :8b<CR>
nnoremap <M-9> :9b<CR>

" disable netrw
let loaded_netrwPlugin = 1

" === start FUNCTIONS ===
function! BufferIsEmpty()
    if line('$') == 1 && getline(1) == ''
        return 1
    else
        return 0
    endif
endfunction

function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
"        if bufexists(i) && bufname(i) == ''
        if bufloaded(i) && bufname(i) == '' && getbufline(i, 1, 2) == ['']
            call add(empty, i)
        endif
        let i += 1
    endwhile
    echo len(empty)
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction
" ===== end FUNCTIONS ===

" ncm2
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Suggestions from: https://realpython.com/vim-and-python-a-match-made-in-heaven
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP 8 code standard
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Code standard for other types
au BufNewFile,BufRead *.js,*.html,*.css,*.vue
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

" Flag unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" === start custom filetypes ===
au BufRead,BufNewFile *.vue
    \ set filetype=javascript
" ===== end custom filetypes ===

" === start ncm2 ===
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" ===== end ncm2 ===

" Ctrl-p function
"nnoremap <C-B> :CtrlPBuffer<CR>
"nnoremap <C-M> :CtrlPMRUFiles<CR>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" UltiSnips
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" VimFiler
"let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_as_default_explorer = 1
noremap <Leader>d :VimFilerExplorer<CR>

" Denite


" Neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (
" after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

let g:neomake_open_list=2
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" gutentags
let g:gutentags_define_advanced_commands = 1
"let g:gutentags_project_info = [
"      \ {
"      \ 'type': 'javascript',
"      \ 'file': 'package.json'
"      \ }
"      \]
"let g:gutentags_file_list_command = 'find . -type f -iregex ".*\.\(js\|vue\)$" -not -path "./node_modules/*"'
"let g:gutentags_ctags_executable_javascript = $PWD .'./node_modules/.bin/jsctags -f'
