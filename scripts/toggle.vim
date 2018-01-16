"
" 2018/01/16 extracted form vimrc for consistency
"

function! Tognums()
" tri-toggle number,relativenumber, and list
if &number
    set nonumber
    set norelativenumber
    set nolist
elseif &relativenumber
    set number
    set norelativenumber
    set list
else
    set nonumber
    set relativenumber
    set list
endif

endfunction

function! Togmouse()
" toggle mouse on/off
if &mouse == 'a'
    set mouse=
    echo "Mouse Off"
else
    set mouse=a
    echo "Mouse On"
endif
endfunction
