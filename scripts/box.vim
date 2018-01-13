"
" 2018/01/12 created
"

let b:last_dir="right"

" helper function to see the value of the char under the cursor
function! Asciiit()
    let cc = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
    echo cc 
endfunction

function! UpArrow()
    if (b:last_dir=="up")
        :execute "normal kr\<C-v>u2502\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal kr\<C-v>u2502\<esc>"
    elseif (b:last_dir=="right")
        :execute "normal r\<C-v>u2518\<esc>k"
        :execute "normal r\<C-v>u2502\<esc>"
    elseif (b:last_dir=="left")
        :execute "normal r\<C-v>u2514\<esc>k"
        :execute "normal r\<C-v>u2502\<esc>"
    endif
        let b:last_dir="up"
endfunction

function! RightArrow()
    if (b:last_dir=="up")
        :execute "normal r\<C-v>u250C\<esc>l"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal r\<C-v>u2514\<esc>l"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="right")
        :execute "normal r\<C-v>u2500\<esc>l"
    elseif (b:last_dir=="left")
        :execute "normal lr\<C-v>u2500\<esc>"
    endif
        let b:last_dir="right"
endfunction

function! LeftArrow()
    if (b:last_dir=="up")
        :execute "normal r\<C-v>u2510\<esc>h"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal r\<C-v>u2518\<esc>h"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="right")
        :execute "normal hr\<C-v>u2500\<esc>"
    elseif (b:last_dir=="left")
        :execute "normal r\<C-v>u2500\<esc>h"
    endif
        let b:last_dir="left"
endfunction

function! DownArrow()
    if (b:last_dir=="up")
        :execute "normal jr\<C-v>u2502\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal r\<C-v>u2502\<esc>j"
    elseif (b:last_dir=="right")
        :execute "normal r\<C-v>u2510\<esc>j"
        :execute "normal r\<C-v>u2502\<esc>"
    elseif (b:last_dir=="left")
        :execute "normal r\<C-v>u250C\<esc>j"
        :execute "normal r\<C-v>u2502\<esc>"
    endif
        let b:last_dir="down"
endfunction



nnoremap <buffer> <right>   :call RightArrow()<cr>
nnoremap <buffer> <left>    :call LeftArrow()<cr>
nnoremap <buffer> <up>      :call UpArrow()<cr>
nnoremap <buffer> <down>    :call DownArrow()<cr>

" helper mappings
"   , replace char with space, helps fix mistakes
"   \s -- create a scratchpad (space) to work inside
"   \a -- helper mapping to read ascii value
nnoremap <buffer> , r<space>l
nnoremap <buffer> <leader>s :set list<cr>Go<esc>72i <esc>yy32p0
nnoremap <buffer> <leader>a :call Asciiit()<cr>


" NOTES
" http://derekwyatt.org/2015/07/27/getting-character-under-cursor-in-vim/
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

