scriptencoding utf-8

if exists('g:loaded_vague_input_python')
    finish
endif
let g:loaded_vague_input_python = 1

let s:save_cpo = &cpo
set cpo&vim

" detect whether cursor position is on the end of indent
function! vagueinputpython#IsTabPosition()
    let col = col('.') - 1
    return !col || (
        \ !(col % &softtabstop) &&
        \ getline('.')[0: col - 1] =~ '\s\{' . col . '}'
    \ )
endfunction

"" assign function to CR/TAB/S-TAB for Python
"" depends on 'prabirshrestha/asyncomplete.vim'
"" https://github.com/prabirshrestha/asyncomplete.vim
function! vagueinputpython#Configure()
    inoremap <silent><expr> <CR>
        \ pumvisible() ? asyncomplete#close_popup() : "\<CR>"
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ vagueinputpython#IsTabPosition() ? "\<C-t>" :
        \ asyncomplete#force_refresh()
    inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-p>" : "\<C-d>"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
