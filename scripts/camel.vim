"
" 2017/12/06 created
" 

" move to next Camel word
noremap ,n /[A-Z]<CR>:noh<CR>

" move back to Camel word
noremap ,b ?[A-Z]<CR>:noh<CR>

" visual highlight next Camel word
noremap ,c :call CamelVisualWord()<CR>

" Camel word motion for Text Object commands
" for example:
"    dc to delete next Camel word
"    cc to change next Camel word
"    yc to yank Camel Word 
onoremap c :<c-u>execute ":call CamelVisualWord()"<CR>


function! CamelVisualWord()
    " if we are not at a Capital search backward to find one
    if getline('.')[col('.')-1] !~# "[A-Z]" 
        let rc=search('[A-Z]', "b", line('.'))
    endif

    " if still not at a Capital search forward to find one
    if getline('.')[col('.')-1] !~# "[A-Z]" 
        let rc=search('[A-Z]', "", line('.'))
    endif

    " if still not at a Capital....
    " must be a line w/o Camel words, just exit 
    "
    if getline('.')[col('.')-1] !~# "[A-Z]" 
        return 0
    endif


    " by now we have a capital letter under the cursor
    " turn on visual and move to next Capital or space or eol
    " if we find eol just exit else move left one char
    :normal! v
    let rc=search('[A-Z]\|\s\|.$', "", line('.'))

    " if we are at the last char on the line we are done
    if col('.') == col('$')-1 
        return 0
    endif

    " move left one char
    :normal! h
endfunction

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" NOTES
" The CTRL-U (<C-U>) is used to remove the range that Vim may insert. 
" CTRL-U to ignore the starting cursor position and select different text.
