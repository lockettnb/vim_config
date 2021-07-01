"
" 2021/02/17 
" Toggle Vexplore on/off 
"


function! ToggleVertExplorer()
    " get number of last buffer
        let i = bufnr("$")

        let wasOpen = 0

    " count down thru buffer list looking for open vert explore
        while (i >= 1)
            let ft = getbufvar(i, "&filetype")
            if ft == "netrw"
                silent exe "bd " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile

    " if vert explore was NOT open, open it
    if !wasOpen
        silent Vexplore
    endif


endfunction


