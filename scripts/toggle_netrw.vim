"
" 2021/02/17 
" from https://vi.stackexchange.com/questions/10988/toggle-explorer-window
"
"

function! ToggleVertExplorer()
        let i = bufnr("$")
        let wasOpen = 0
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bdelete " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile
    if !wasOpen
        silent Vexplore
    endif
endfunction

nmap <leader>v :call ToggleVertExplorer()<cr>

function! NetrwMapping()
"    let g:netrw_banner = 0 " remove the banner at the top
    let g:netrw_liststyle = 3  " default directory view. Cycle with i 
    let g:netrw_browse_split = 4
    let g:netrw_winsize = 25
"    let g:netrw_altv = 1
"    let g:netrw_sort_sequence = '[\/]$,*

"    let g:netrw_list_hide= '.*.swp$, 
            "\ *.pyc$,
            "\ *.log$,
            "\ *.o$,
            "\ *.xmi$,
            "\ *.swp$,
            "\ *.bak$,
            "\ *.pyc$,
            "\ *.class$,
            "\ *.jar$,
            "\ *.war$,
            "\ *__pycache__*'
endfunction

"augroup netrw_mapping
    "autocmd!
    "autocmd filetype netrw call NetrwMapping()
"augroup END




" ---------------------------------------------------
"function! ToggleNetrw()
        "let i = bufnr("$")
        "let wasOpen = 0
        "while (i >= 1)
            "if (getbufvar(i, "&filetype") == "netrw")
                "silent exe "bwipeout " . i
                "let wasOpen = 1
            "endif
            "let i-=1
        "endwhile
    "if !wasOpen
        "silent Lexplore
    "endif
"endfunction
"map <F3> :call ToggleNetrw() <CR>
" ---------------------------------------------------
" nmap <leader>9 :call ToggleVimExplorer()<cr>
"function! ToggleVimExplorer()
  "if exists("t:expl_buf_num")
      "let expl_win_num = bufwinnr(t:expl_buf_num)
      "if expl_win_num != -1
          "let cur_win_nr = winnr()
          "exec expl_win_num . 'wincmd w'
          "close
          "exec cur_win_nr . 'wincmd w'
          "unlet t:expl_buf_num
      "else
          "unlet t:expl_buf_num
      "endif
  "else
      "exec '1wincmd w'
      "Vexplore 
      "" After switching to netwr buff, lets resize to 45
      "vertical resize 45
      "let t:expl_buf_num = bufnr("%")
  "endif
"endfunction
