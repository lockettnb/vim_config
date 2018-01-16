

" Help delete character if it is 'empty space'
" stolen from Vim manual
function! Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

iab <silent> <buffer> iinc #include <><Left><c-r>=Eatchar()<CR>
iab <silent> <buffer> idef #define <c-r>=Eatchar()<CR> 

iab <silent> <buffer> iprintf printf ("\n");<ESC>?\<CR>:nohl<CR>i<c-r>=Eatchar()<CR>

iab <silent> <buffer> ifor for (;;){<CR><CR>}<ESC>?;;<CR>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> fori for (i=0;  ; i++){<CR><CR>}<ESC>?0;<CR>3l:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> iwhile while (){<CR><CR>}<ESC>?)<CR>:nohl<CR>i<c-r>=Eatchar()<CR>

iab <silent> <buffer> iif if (){<CR><CR>}<ESC>?)<CR>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> iifelse if (){<CR><CR>} else {<CR><CR>}<ESC>?)<CR>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> ielse else {<CR>x;<CR>}<ESC>?x;<CR><Del><Del>:nohl<CR>i<c-r>=Eatchar()<CR>

iab <silent> <buffer> imain int main(int argc, char **argv)<CR>{<CR>x;<CR><tab>return 0;<CR>}<CR><ESC>?x;<CR><Del><Del>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> ifun int xx( )<CR>{<CR><CR><tab>return 0;<CR>}<CR><ESC>?xx<CR><Del><Del>:nohl<CR>i<c-r>=Eatchar()<CR>


" NOTES:
" ctrl-o  -- one normal command while in insert mode
