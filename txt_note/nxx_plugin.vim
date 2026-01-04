
" 2025/12/11
" 2026/01/02 added relative path to source script file

" :source scripts for colour highlight bits
let s:plugin_dir = expand('<sfile>:p:h:h')
:source `=s:plugin_dir . '/scripts/nxx_colour_marker.vim' `


" Hardcoded approach
" :source $HOME/.vim/scripts/nxx_colour_marker.vim

" The special <sfile> in Vimscript refers to the name of the file being sourced
" You can apply filename modifiers to get different parts of the path: 
"    :p makes the path a full path.
"    :h gets the "head" of the path (the directory part),
"       removing the last filename component.
"       Applying it twice gets the parent directory

" for example ---> let s:dir = expand('<sfile>:p:h')
" for example ---> let s:plugin_root = expand('<sfile>:p:h:h')
