

" Help delete character if it is 'empty space'
" stolen from Vim manual
function! Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

iab <silent> <buffer> #i #include <><Left><c-r>=Eatchar()<CR>
iab <silent> <buffer> #d #define <c-r>=Eatchar()<CR> 

iab <silent> <buffer> printf printf ("\n");<ESC>?\<CR>:nohl<CR>i<c-r>=Eatchar()<CR>

iab <silent> <buffer> for for (;;){<CR><CR>}<ESC>?;;<CR>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> fori for (i=0;  ; i++){<CR><CR>}<ESC>?0;<CR>3l:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> while while (){<CR><CR>}<ESC>?)<CR>:nohl<CR>i<c-r>=Eatchar()<CR>

iab <silent> <buffer> if if (){<CR><CR>}<ESC>?)<CR>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> ifelse if (){<CR><CR>} else {<CR><CR>}<ESC>?)<CR>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> else else {<CR>x;<CR>}<ESC>?x;<CR><Del><Del>:nohl<CR>i<c-r>=Eatchar()<CR>

iab <silent> <buffer> intmain int main(int argc, char **argv)<CR>{<CR>x;<CR><tab>return 0;<CR>}<CR><ESC>?x;<CR><Del><Del>:nohl<CR>i<c-r>=Eatchar()<CR>
iab <silent> <buffer> intfun int xx( )<CR>{<CR><CR><tab>return 0;<CR>}<CR><ESC>?xx<CR><Del><Del>:nohl<CR>i<c-r>=Eatchar()<CR>


" NOTES:
" ctrl-o  -- one normal command while in insert mode
