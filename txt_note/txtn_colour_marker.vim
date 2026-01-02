"
" 2025/12/09
" 2026/01/01 added <leader>b for marking block notes

" Note Block: indent and  mark with ┆ 
" ┆   u+2506    Box Drawings Light Triple Dash Vertical
vnoremap <leader>b :norm i<TAB>┆ <CR>


" Clear Colour Highlights
noremap <buffer> ,,C :s/<colour=\a\+>\(\_.\{-}\)<\/colour>/\1/g<cr>

" Colour Highligt visual selection 
vnoremap <buffer> ,,r :<c-u>call ColourIt("red")<cr><esc>
vnoremap <buffer> ,,g :<c-u>call ColourIt("green")<cr><esc>
vnoremap <buffer> ,,b :<c-u>call ColourIt("blue")<cr><esc>
vnoremap <buffer> ,,y :<c-u>call ColourIt("yellow")<cr><esc>
vnoremap <buffer> ,,m :<c-u>call ColourIt("magenta")<cr><esc>

" wft is this
noremap  <buffer> ,,c :normal 0

function! ColourIt(co)
    " move to end of visual selection
    :execute "normal! \<esc>`>"
    " append end tag
    :execute "normal! a</colour>\<esc>"
    " move to start of visual selection
    :execute "normal! `<"
    " insert start tag
    let cmd= "normal! i<colour=" . a:co . ">\<esc>"
    " echom cmd
    :execute cmd
endfunction


" NOTES ON REGEX
"  on this line find start colour tag
"  then capture group text between colour tags
"  replace with just capture group
" s/<colour=\a\+>\(\_.\{-}\)<\/colour>/\1/g
" /               start of regex
"  <colour=       literal
"  \a\+           one or more alpha chars
"  >              literal
"  \(             start of capture group
"     \_.         any char including new line
"     \{-}        non-greedy one or more
"  \)             end of capture
"  <\/colour>     literal
" /               end of regex
" \1              substitute capture group 1
" /g              global on this line
"
"
"
