" http://vim.wikia.com/wiki/C/C%2B%2B_function_abbreviations
" created January 4, 2005 · complexity intermediate · author Vladimír Marek · version 6.0 



" Help delete character if it is 'empty space'
" stolen from Vim manual
function! Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

" Replace abbreviation if we're not in comment or other unwanted places
" stolen from Luc Hermitte's excellent http://hermitte.free.fr/vim/
function! MapNoContext(key, seq)
  let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
  if syn =~? 'comment\|string\|character\|doxygen'
    return a:key
  else
    exe 'return "' .
    \ substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) . '"'
  endif
endfunction

" Create abbreviation suitable for MapNoContext
function! Iab (ab, full)
  exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('".
    \ a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
    \"')<CR>"
endfunction

call Iab('#d', '#define ')
call Iab('#i', '#include <><Left>')
call Iab('#I', '#include ""<Left>')
call Iab('printf', 'printf ("\n");<C-O>?\<CR>')
call Iab('if', 'if ()<CR>{<CR>}<Left><C-O>?)<CR>')
call Iab('for', 'for (;;)<CR>{<CR>}<C-O>?;;<CR>')
call Iab('while', 'while ()<CR>{<CR>}<C-O>?)<CR>')
call Iab('else', 'else<CR>{<CR>x;<CR>}<C-O>?x;<CR><Del><Del>')
call Iab('ifelse', 'if ()<CR>{<CR>}<CR>else<CR>{<CR>}<C-O>?)<CR>')
call Iab('intmain', 'int<CR>main (int argc, char **argv)<CR>'.
 \ '{<CR>x;<CR>return 0;<CR>}<CR><C-O>?x;<CR><Del><Del>')

  exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('".a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"')."')<CR>"
      "----------------------"      "---------------------"      "----" --------------------------------------------- "------"

call Iab('#i', '#include <><Left>')

iab <silent> <buffer> #i #include \<\>\<Left>\<C-R>=Eatchar()\<CR>
