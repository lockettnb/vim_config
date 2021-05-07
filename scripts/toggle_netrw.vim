"
" 2021/02/17 
" Toggle Vexplore on/off 
"


function! ToggleVertExplorer()
        let i = bufnr("$")
        let wasOpen = 0
        while (i >= 1)
            let ft = getbufvar(i, "&filetype")
            if ft == "netrw"
                silent exe "bd " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile
    if !wasOpen
        silent Vexplore
    endif


endfunction


