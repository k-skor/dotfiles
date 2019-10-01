" Python specific filetype settings
" 
" Suggestions from: https://realpython.com/vim-and-python-a-match-made-in-heaven
" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Enable folding with the spacebar
nnoremap <space> <buffer> za

" PEP 8 code standard
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

setlocal encoding=utf-8
