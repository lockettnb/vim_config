"
" 2024/01/14  created
"


function! MoveIt()
" move cursor to EOL, but if at EOL move to middle
  let l:line_len=strlen(getline('.'))
  let l:mid = l:line_len /2
echom col('.')

    if col('.') == l:mid
        :execute "normal! 0"
    elseif col('.') < l:line_len
        :execute "normal! $"
    else
        call cursor(line('.'), l:mid)
    endif
endfunction



function! MoveItRight()
" move cursor to EOL, but if at EOL move to middle
  let l:line_len=strlen(getline('.'))
  let l:mid = l:line_len /2

    if col('.') < l:line_len
        :execute "normal! $"
    else
"       echom " move to middle from " . col('.') ." to ". l:mid
        call cursor(line('.'), l:mid)
    endif
endfunction

function! MoveItLeft()
" move cursor to SOL, but if at SOL move to middle
  let l:line_len=strlen(getline('.'))
  let l:mid = l:line_len /2

    if col('.') > 1
        :execute "normal! 0"
    else
"       echom " move to middle from " . col('.') ." to ". l:mid
        call cursor(line('.'), l:mid)
    endif
endfunction

