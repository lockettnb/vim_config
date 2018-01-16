"
" 2018/01/14 

" map \q <ESC>`>a)<ESC>`<i(<ESC>

function! QuoteIt()
    :execute "normal! \<esc>`>"

    if getline('.')[col('.')] ==# "\"" 
        echom " 1 found quote at end"
        :execute "normal! `<"
    else
        echom " 2 not found quote at end"
        :execute "normal! a\"\<esc>`<"
    endif 

     if getline('.')[col('.')-2] ==# "\"" 
        echom " 3 found quote at beginning"
        :execute "normal! \<esc>l"
    else
        echom " 4 not found quote at beginning"
        :execute "normal! i\"\<esc>l"
    endif

    echom " done "

endfunction

vnoremap <buffer> <leader>t :<c-u>call QuoteIt()<cr><esc>

" NOTES
"     let cc = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
"
"     if getline('.')[col('.')-1] !~# "[A-Z]" 
"         let rc=search('[A-Z]', "b", line('.'))
"     endif

