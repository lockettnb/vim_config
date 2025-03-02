"
" 2018/01/12 created
" 2022/02/01 added box drawing and arrowheads
" 2025/02/09 changed from Arrow key to ALT-Arrow keys for drawing lines

let b:last_dir="right"

" ARROW AND BOX MAPPINGS
"   ,x -- draw box around visual selection
nnoremap <buffer> <A-right>   :call RightArrow()<cr>
nnoremap <buffer> <A-left>    :call LeftArrow()<cr>
nnoremap <buffer> <A-up>      :call UpArrow()<cr>
nnoremap <buffer> <A-down>    :call DownArrow()<cr>
vnoremap <buffer> ,x <ESC>:call DrawBox()<CR>

" ARROWHEAD MAPPINGS
" ◀  ▶  ▲  ▼
nnoremap <buffer> ,<right>  r▶
nnoremap <buffer> ,<left>  r◀
nnoremap <buffer> ,<up>  r▲
nnoremap <buffer> ,<down>  r▼

" HELPER MAPPINGS
"   ,s -- create a scratchpad (space) to work inside
"   ,a -- helper mapping to read ascii value
nnoremap <buffer> ,s :set list<cr>Go<esc>72i <esc>yy32p0
nnoremap <buffer> ,a :call Asciiit()<cr>


" fixing mistakes with spaces, not much quicker that r<space><space>
" nnoremap <buffer> ,<space> r<space>l
"
" TESTING MAPPINGS
noremap ,r :source /home/john/src/tidbits/vim/boxie.vim<CR>


function! UpArrow()
    if (b:last_dir=="up")
        :execute "normal kr\<C-v>u2502\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal kr\<C-v>u2502\<esc>"
    elseif (b:last_dir=="right")
        :execute "normal r\<C-v>u2518\<esc>k"
        :execute "normal r\<C-v>u2502\<esc>"
    elseif (b:last_dir=="left")
        :execute "normal r\<C-v>u2514\<esc>k"
        :execute "normal r\<C-v>u2502\<esc>"
    endif
        let b:last_dir="up"
endfunction

function! RightArrow()
    if (b:last_dir=="up")
        :execute "normal r\<C-v>u250C\<esc>l"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal r\<C-v>u2514\<esc>l"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="right")
        :execute "normal r\<C-v>u2500\<esc>l"
    elseif (b:last_dir=="left")
        :execute "normal lr\<C-v>u2500\<esc>"
    endif
        let b:last_dir="right"
endfunction

function! LeftArrow()
    if (b:last_dir=="up")
        :execute "normal r\<C-v>u2510\<esc>h"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal r\<C-v>u2518\<esc>h"
        :execute "normal r\<C-v>u2500\<esc>"
    elseif (b:last_dir=="right")
        :execute "normal hr\<C-v>u2500\<esc>"
    elseif (b:last_dir=="left")
        :execute "normal r\<C-v>u2500\<esc>h"
    endif
        let b:last_dir="left"
endfunction

function! DownArrow()
    if (b:last_dir=="up")
        :execute "normal jr\<C-v>u2502\<esc>"
    elseif (b:last_dir=="down")
        :execute "normal r\<C-v>u2502\<esc>j"
    elseif (b:last_dir=="right")
        :execute "normal r\<C-v>u2510\<esc>j"
        :execute "normal r\<C-v>u2502\<esc>"
    elseif (b:last_dir=="left")
        :execute "normal r\<C-v>u250C\<esc>j"
        :execute "normal r\<C-v>u2502\<esc>"
    endif
        let b:last_dir="down"
endfunction


function! DrawBox()
"   getpos returns byte positions on columns
    let [ln1 ,col1] = getpos("'<")[1:2]
    let [ln2 ,col2] = getpos("'>")[1:2]

    let cvx1 = virtcol("'<")
    let cvx2 = virtcol("'>")

    let hsteps = cvx2-cvx1
    let vsteps = ln2-ln1

"   Step 0: move to start of visual selection
    call setpos(".", [0,ln1 ,col1,0])

"   Step 1: move right horz
    let cx=0
    while(cx<hsteps)
        call RightArrow()
        let cx=cx+1
    endwhile

"   Step 2: move down vertically
    let lx=0
    while(lx<vsteps)
        call DownArrow()
        let lx=lx+1
    endwhile

"   Step 3: move left horz
    let cx=0
    while(cx<hsteps)
        call LeftArrow()
        let cx=cx+1
    endwhile

"   Step 4: move up vertically
    let lx=0
    while(lx<vsteps)
        call UpArrow()
        let lx=lx+1
    endwhile

"   Step 5: Close the box and reset cursor
    call RightArrow()
    call setpos(".", [0,ln1 ,col1,0])

endfunction


" helper function to see the value of the char under the cursor
function! Asciiit()
    let cc = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
    echo printf("%x", cc)
endfunction





" NOTES
" http://derekwyatt.org/2015/07/27/getting-character-under-cursor-in-vim/
"
" BOX LINES
" │ 9474    2502    BOX DRAWINGS LIGHT VERTICAL
" ─ 9472    2500    BOX DRAWINGS LIGHT HORIZONTAL 
" ┌ 9484    250C    BOX DRAWINGS LIGHT DOWN AND RIGHT
" └ 9492    2514    BOX DRAWINGS LIGHT UP AND RIGHT
" ┐ 9488    2510    BOX DRAWINGS LIGHT DOWN AND LEFT 
" ┘ 9496    2518    BOX DRAWINGS LIGHT UP AND LEFT
"
" TRIANGLES
" ◀     25C0 Triangle Left
" ▶     25B6 Triangle Right
" ▲     25B2 Triangle Up
" ▼     25BC Triangel Down 



"function! TopLeft(l, c)
"    call setpos(".", [0,a:l,a:c,0])
"    :normal r┌
"endfunction
"
"function! TopRight(l, c)
"    call setpos(".", [0,a:l,a:c,0])
"    :normal r┐
"endfunction
"
"function! BotRight(l,c)
"    call setpos(".", [0,a:l,a:c,0])
"    :normal r┘
"endfunction
"
"function! BotLeft(l,c)
"    call setpos(".", [0,a:l,a:c,0])
"    :normal r└
"endfunction

