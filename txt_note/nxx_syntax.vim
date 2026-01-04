" 2025/12/07
" 2026/01/02 added new title highlights

" this determines how text with the "conceal" syntax attribute is displayed
" level 3 text is completely hidden
set conceallevel=3

" clears previous matches in the window
" only need this when source-ing the syntax file directly
" :call clearmatches()

" vim system sytanx group seem to start with capital letters so,
" I am going to use all caps for my highlight names
highlight RED   ctermbg=NONE ctermfg=red
highlight GRN   ctermbg=NONE ctermfg=green
highlight BLU   ctermbg=NONE ctermfg=blue
highlight YEL   ctermbg=NONE ctermfg=yellow
highlight CYN   ctermbg=NONE ctermfg=cyan
highlight MAG   ctermbg=NONE ctermfg=Magenta

highlight DATE    ctermbg=NONE ctermfg=cyan
highlight CLI     ctermbg=NONE ctermfg=green
highlight ROOT    ctermbg=NONE ctermfg=red
highlight CLI_OUT ctermbg=NONE ctermfg=yellow
highlight NOTE    ctermbg=NONE ctermfg=Magenta

" x202_OrangeRed1  x214_Orange1  x130_DarkOrange3
highlight MAINTITLE ctermbg=NONE ctermfg=202
highlight SUBTITLE  ctermbg=NONE ctermfg=214
highlight UNDER     ctermbg=NONE ctermfg=130


" COLOUR DATES, CODE SECTIONS, BLOCK NOTES
" colour dates -- yyyy/mm/dd
syntax match DATE '\d\{4\}/\d\d/\d\d'

" user CLI command -- space indented with dollar sign
syntax match CLI ' \{4,6\}[$] .*$'

" root CLI command -- space indent with hash sign 
syntax match ROOT ' \{4,6\}# .*$'

" command output/result --> │ .U+2502 Box Drawings Light Vertical
syntax match CLI_OUT ' \{4,6\}│.*$'

" indented note --> ┆ U+2506 Box Drawings Light Triple Dash Vertical
syntax match NOTE ' \{4,6\}┆ .*$'

" COLOUR SECTION TITLES
"   \zs start hilight match
"   \ze end hilight match
syntax match MAINTITLE "^\zs\p*\ze\n=\+$"
syntax match SUBTITLE "^\zs\p*\ze\n-\+$"
syntax match UNDER '^=\+$'
syntax match UNDER '^-\+$'


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



