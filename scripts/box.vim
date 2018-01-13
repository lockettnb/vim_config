"
" 2018/01/12 created
"
" │	9474	│	2502	BOX DRAWINGS LIGHT VERTICAL
" 
" ─	9472	─	2500	BOX DRAWINGS LIGHT HORIZONTAL 
" 
" ┌	9484	┌	250C	BOX DRAWINGS LIGHT DOWN AND RIGHT
" 
" └	9492	└	2514	BOX DRAWINGS LIGHT UP AND RIGHT
" 
" ┐	9488	┐	2510	BOX DRAWINGS LIGHT DOWN AND LEFT 
" 
" ┘	9496	┘	2518	BOX DRAWINGS LIGHT UP AND LEFT


let w:last_dir="right"


function! Asciiit()
    let cc = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
    echo cc 
"    if (cc == 9472)
"        :exec  "normal li\<c-v>u2502\<esc>"
"    endif
endfunction

function! UpArrow()
    if (w:last_dir=="up")
        :execute "normal kr\<C-v>u2502\<esc>"
    elseif (w:last_dir=="down")
        :execute "normal kr\<C-v>u2502\<esc>"
    elseif (w:last_dir=="right")
        :execute "normal r\<C-v>u2518\<esc>k"
        :execute "normal r\<C-v>u2502\<esc>"
    elseif (w:last_dir=="left")
        :execute "normal r\<C-v>u2514\<esc>k"
        :execute "normal r\<C-v>u2502\<esc>"
    endif
        let w:last_dir="up"
endfunction

function! RightArrow()
    if (w:last_dir=="up")
        :execute "normal r\<C-v>u250C\<esc>l"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (w:last_dir=="down")
        :execute "normal r\<C-v>u2514\<esc>l"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (w:last_dir=="right")
        :execute "normal r\<C-v>u2500\<esc>l"
    elseif (w:last_dir=="left")
        :execute "normal lr\<C-v>u2500\<esc>"
    endif
        let w:last_dir="right"
endfunction

function! LeftArrow()
    if (w:last_dir=="up")
        :execute "normal r\<C-v>u2510\<esc>h"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (w:last_dir=="down")
        :execute "normal r\<C-v>u2518\<esc>h"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (w:last_dir=="right")
        :execute "normal hr\<C-v>u2500\<esc>"
    elseif (w:last_dir=="left")
        :execute "normal r\<C-v>u2500\<esc>h"
    endif
        let w:last_dir="left"
endfunction

function! DownArrow()
    if (w:last_dir=="up")
        :execute "normal jr\<C-v>u2502\<esc>"
    elseif (w:last_dir=="down")
        :execute "normal r\<C-v>u2502\<esc>j"
    elseif (w:last_dir=="right")
        :execute "normal r\<C-v>u2510\<esc>j"
        :execute "normal r\<C-v>u2502\<esc>"
    elseif (w:last_dir=="left")
        :execute "normal r\<C-v>u250C\<esc>j"
        :execute "normal r\<C-v>u2502\<esc>"
    endif
        let w:last_dir="down"
endfunction



nnoremap <buffer> <right>   :call RightArrow()<cr>
nnoremap <buffer> <left>    :call LeftArrow()<cr>
nnoremap <buffer> <up>      :call UpArrow()<cr>
nnoremap <buffer> <down>    :call DownArrow()<cr>
nnoremap <buffer> , r<space>l
nnoremap <buffer> <leader>s Go<esc>72i <esc>yy32p0
nnoremap <buffer> <leader>a :call Asciiit()<cr>


" NOTES
" http://derekwyatt.org/2015/07/27/getting-character-under-cursor-in-vim/
