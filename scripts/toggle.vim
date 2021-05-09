"
" 2018/01/16 extracted from vimrc for consistency
" 2021/05/08 fixed toggle for relative with numbers

function! Tognums()
" tri-toggle number,relativenumber, and list
if &relativenumber && &number
    " currently relative, change to absolute
    set norelativenumber
    set number
    set list
elseif (&relativenumber==0) && &number
    " currently absolute, change to no numbers
    set norelativenumber
    set nonumber
    set nolist
else
    " currently none, change to relative numbers
    set relativenumber
    set number
    set list
endif

" if &number
"     set nonumber
"     set norelativenumber
"     set nolist
" elseif &relativenumber
"     set nonumber
"     set norelativenumber
"     set number
"     set list
" else
"     set nonumber
"     set relativenumber
"     set number
"     set list

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
