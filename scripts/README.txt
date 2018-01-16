
Notes on vim Scripts
====================

box.vim
-------
Use arrow keys to draw boxes using the  unicode box characters.
These mappings are all buffer specific.

\s  -- create a scratchpad for drawing boxes
,   -- 
\a  -- leftover from testing; show unicode value of char under cursor
       http://derekwyatt.org/2015/07/27/getting-character-under-cursor-in-vim/

<up>    -- vertial 0x2502 or 0x2518 or 0x2514
<down>  -- vertial 02502 or 0x2510 or 0x250c
<right> -- horizontal 0x2500 or 0x250C or 0x2514
<left>  -- horizontal 0x2500 or 0x2510 or 0x2518


 │	9474	│	2502	BOX DRAWINGS LIGHT VERTICAL
 
 ─	9472	─	2500	BOX DRAWINGS LIGHT HORIZONTAL 
 
 ┌	9484	┌	250C	BOX DRAWINGS LIGHT DOWN AND RIGHT
 
 └	9492	└	2514	BOX DRAWINGS LIGHT UP AND RIGHT
 
 ┐	9488	┐	2510	BOX DRAWINGS LIGHT DOWN AND LEFT 
 
 ┘	9496	┘	2518	BOX DRAWINGS LIGHT UP AND LEFT




camel.vim
---------
,n  -- move to next camel word
,b  -- move back to last camel word
,c  -- visual highlight camel word

Camel word motion for Text Object commands
for example:
   dc to delete next Camel word
   cc to change next Camel word
   yc to yank Camel Word 


quotes.vim
----------
Still underdevelopment

\t  -- t for test, quote the visually selected section








2018/01/15 
