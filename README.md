Vim Configuration/Setup

This is my personal vim setup.  My vimrc is here along
with my vim cheatsheet and a couple vim scripts.

Vim Configuration (vimrc)
-------------------------
I keep my vimrc in a text file and use a simple make file to copy it and any 
scripts to their final destinations. 

SECTION ONE -- Options
Bunch of options to config vim as I like it.

SECTION TWO -- Functions
Couple scripts to toggle numbers on/off/relative and mouse on/off.

SECTION THREE -- Key Mappings
The magic sauce to make vim really hum.  

It do not take a lot to add a bit of magic to vim. 
"nnoremap L $" is one of my favorite ones.

SECTION FOUR -- Function Key Mappings 
system clipboard integration     F2 - paste text from clipboard
date yyyy/mm/dd                  F3 - insert date
markdown helper                  F4 - underline title with =
markdown helper                  F5 - underline title with - 
text document helper             F6 - wrap paragraph
markdown helper                  F7 - preview markdown
web helper                       F8 - start browswer with URL under cursor


Cheatsheet
----------
The cheat directory has my personal cheatsheeti (vim_sheet.md).  Must be
getting old as I find I need help remember vim bits. I have this linked to a
key mapping ,c to quickly display it in the middle of a vim session.

The make file need pandoc (html) and pdflatex (pdf) installed to convert the source file
vim_sheet.md to other formats.


Scripts
-------
A few scripts that I use occasionally so they are not installed in my .vim
directory.  I usually just :souce these files when I want to use one of these
scripts.

scripts/camel.vim   -- move around camel style and delete/yank/copy camel text objects  
scripts/box.vim     -- draw text boxes using the arrow keys  
scripts/tognum.vim  -- toggle numbers on/off/relative (also turns on/off hidden chars)  

scripts/showmd 
-- not really vim script. Currently I use a make file to convert markdown
to html (via pandoc) and preview it in firefox.  This bash script is a fancy way 
to convert without a temporary file. I might add this to vimrc someday. 
