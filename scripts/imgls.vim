"
" 2021/01/29 created 
" 2021/02/02 added image viewer mappings
"
" change comment field
noremap <buffer> ,c 0f;;;;w

" change date field 
noremap <buffer> ,d 0f;f;wct 1901/01/01<esc>B
noremap <buffer> ,D 0f;f;wct 

" change time field 
noremap <buffer> ,t 0f;f;wWct 06:00:00<esc>B
noremap <buffer> ,T 0f;f;wWct 

" increment sequence number (used buffer m) 
noremap <buffer> ,n k0f;;;w"myt j0f;;;wdt "mP<C-A>j
let @n='k0f;;;w"myt j0f;;;wdt "mPj'

" zero seq number
noremap <buffer> ,z 0f;;;wct 0<esc>j
let @z='0f;;;wct 0j'

" set date/time/name/comment same as above
noremap <buffer> ,s k0f;;wv$h"my<esc>j0f;;wD"mp0f;;j

" image viewer mappings
noremap <buffer> ,p :silent execute "!pxstart"<cr>:execute "redraw!"<cr>
noremap <buffer> ,i :silent execute "!pxindex"<cr>:execute "redraw!"<cr>
noremap <buffer> ,v :call GetName()<cr>:execute "redraw!"<cr>

function! GetName()
    let l:save_cursor = getpos(".")
      :normal! 0vt y
      let l:fn=@@
      let l:cmd= "!pxgoto -f " . l:fn
      :silent execute l:cmd
    call setpos('.', l:save_cursor)
    return
endfunction

