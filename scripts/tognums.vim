

function! Tognums()
" tri-toggle number,relativenumber, and list
if &number
    set nonumber
    set nolist
elseif &relativenumber
    set number
    set list
else
    set relativenumber
    set list
endif

endfunction
