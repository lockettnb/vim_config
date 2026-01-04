" 2025/12/07 

" how text with the "conceal" syntax attribute is displayed
" level 3 text is completely hidden
set conceallevel=3

" clears previous matches in the window
" only need this when source-ing the syntax file directly
" :call clearmatches()

" vim system sytanx group seem to start with capital letters so,
" I am going to use all caps for my highlight names
highlight RED  ctermbg=NONE ctermfg=red
highlight GRN  ctermbg=NONE ctermfg=green
highlight BLU  ctermbg=NONE ctermfg=blue
highlight YEL  ctermbg=NONE ctermfg=yellow
highlight CYN  ctermbg=NONE ctermfg=cyan
highlight MAG  ctermbg=NONE ctermfg=Magenta
highlight DATE ctermbg=NONE ctermfg=cyan


" COLOUR DATES, CODE SECTIONS, BLOCK NOTES
" colour dates -- yyyy/mm/dd
syntax match DATE '\d\{4\}/\d\d/\d\d'

" user command -- space indented with dollar sign
syntax match GRN ' \{4,6\}[$] .*$'

" root command -- space indent with hash sign 
syntax match RED ' \{4,6\}# .*$'

" command output/result --> │ .U+2502 Box Drawings Light Vertical
syntax match YEL ' \{4,6\}│.*$'

" indented note --> ┆ U+2506 Box Drawings Light Triple Dash Vertical
syntax match MAG ' \{4,6\}┆ .*$'

" COLOUR SECTION TITLES
syntax match CYN '-*$'

" COLOUR TEXT ON SINGLE LINE
" FOR EXAMPLE, <colour=blue> text here </colour>
" match markup tag then colour and then conceal start/end tags
" syntax matches exist across windows
syntax match GRN '<colour=green>.*[^<]</colour>'
syntax match RED '<colour=red>.*[^<]</colour>'
syntax match BLU '<colour=blue>.*[^<]</colour>'
syntax match YEL '<colour=yellow>.*[^<]</colour>'
syntax match MAG '<colour=magenta>.*[^<]</colour>'

" first attempt at multiline colour highlight
" syntax match MAG '<colour=magenta>\_.\{-}</colour>'

" CONCEAL TAGs
"   start tag
call matchadd( "Conceal", '<colour=green>', 12, -1 )
call matchadd( "Conceal", '<colour=red>', 12, -1 )
call matchadd( "Conceal", '<colour=blue>', 12, -1 )
call matchadd( "Conceal", '<colour=yellow>', 12, -1 )
call matchadd( "Conceal", '<colour=magenta>', 12, -1 )
" end tag, one statement picks up all end tags
call matchadd( "Conceal", '</colour>', 12, -1 )


"  COLOR NAME *cterm-colors*
" ----------------------------
"  Black
"  DarkBlue
"  DarkGreen
"  DarkCyan
"  DarkRed
"  DarkMagenta
"  Brown, DarkYellow
"  LightGray, LightGrey, Gray, Grey
"  DarkGray, DarkGrey
"  Blue, LightBlue
"  Green, LightGreen
"  Cyan, LightCyan
"  Red, LightRed
"  Magenta, LightMagenta
"  Yellow, LightYellow
"  White


" 2025/12/18 OLD STUFF
" highlight NONE ctermbg=NONE ctermfg=yellow
"
" simple match and colour pattern
" call matchadd( "GRN", 'alan')
"
" match and replace match with fancy char
" call matchadd( "Conceal", 'john', 10, -1,{'conceal':'X'} )
"
" match markup tag then colour and then conceal tag 
" call matchadd("BLUE", '##Blue .*') 
" call matchadd( "Conceal", '##Blue ', 12, -1 )
"
" syntax match RED '<colour=Red>.*[^<]</colour>'
" call matchadd( "Conceal", '<colour=Red>', 12, -1 )
" syntax match NONE '##Red'hs=s,he=e conceal
"
" syntax match BLU '<<Blue .*'
" call matchadd( "Conceal", '<<Blue ', 12, -1 )
"
" mark visual
" syntax match YEL '<<Y[^#]*>>'
" call matchadd( "Conceal", '<<Y', 12, -1 )
" call matchadd( "Conceal", '>>', 12, -1 )
