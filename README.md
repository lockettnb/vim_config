Vim Configuration/Setup

This is my personal vim setup.  My vimrc is here along
with my vim cheatsheet and a couple vim scripts.

Cheatsheet
----------
The cheat directory has my personal cheatsheeti (vim_sheet.md).  Must be
getting old as I find I need help remember vim bits. I have this linked to a
key mapping ,c to quickly display it in the middle of a vim session.

The make file need pandoc (html) and pdflatex (pdf) installed to convert the source file
vim_sheet.md to other formats.


Scripts
-------

scripts/camel.vim   -- move around camel style and delete/yank/copy camel text objects  
scripts/box.vim     -- draw text boxes using the arrow keys  
scripts/tognum.vim  -- toggle numbers on/off/relative (also turns on/off hidden chars)  

scripts/showmd 
-- not really vim script. Currently I use a make file to convert markdown
to html (via pandoc) and preview it in firefox.  This bash script is a fancy way 
to convert without a temporary file. I might add this to vimrc someday. 
