"
" 2021/12/11
" New clipboard fuction, equipped with shell quoting
"
" nmap ,t :call ClipIt()<cr>
" nmap ,r :source clip.vim<cr>


function! ClipIt()
    :enew
    :normal P
    :silent %w ! xsel -ib
    :bd!
endfunction


" ---------------------------------------------------------------
" this quoting method keep failing, more and more chars need quoting
" ---------------------------------------------------------------
" function! ClipIt()
" let txt=substitute(@0, "\x27", "\\\\x27", 'g')  " single quotes
" let txt=substitute(txt, "\x22", "\\\\x22", 'g') " double quotes
" let txt=substitute(txt, "\x0a", "\\\\x0a", 'g') " new lines
" 
" "let cmd=":! echo -e " . "\x27".  txt . "\x27" . " | xsel -ib"
" let cmd=":! printf " . "\x27".  txt . "\x27" . " | xsel -ib"
" exec cmd
" endfunction

