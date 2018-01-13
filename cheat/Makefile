#
# 2015/05/14 created 
# 2016/01/03 added preview target
# 2017/11/28 modifed for vim cheatsheet document flow
#

help:
	@echo "make <build option>"
	@echo "  html       -- HTML document"
	@echo "  pdf        -- PDF document"
	@echo "  twostep    -- LATEX document then PDF document"
	@echo "  viewpdf    -- start PDF reader with PDF cheatsheet"
	@echo "  viewhtml   -- start Firefox with HTML cheatsheet"
	@echo "  clean	    -- remove build files"
	@echo "  superclean	-- remove build files and documents"
	@echo "  doc        -- build HTML documentation "

html: vim_sheet.md md.css
	pandoc -s -c md.css -f markdown -t html -o vim_sheet.html vim_sheet.md

twostep: vim_sheet.md
	pandoc -s -f markdown -t latex --template=cheat.tex -o vim_sheet.tex vim_sheet.md
	pdflatex vim_sheet.tex

pdf: vim_sheet.md
	pandoc -s --template=cheat.tex --latex-engine=pdflatex -o vim_sheet.pdf vim_sheet.md
	
clean:
	rm -f vim_sheet.log vim_sheet.out vim_sheet.aux 
	rm -f  x.log
	rm -f vim.aux vim.log x.log

superclean:
	rm -f vim_sheet.html vim_sheet.tex vim_sheet.pdf vim_sheet.log vim_sheet.out vim_sheet.aux
	rm -f  x.log
	rm -f vim.pdf vim.aux vim.log vim.out

viewhtml: 
	firefox  vim_sheet.html &

viewpdf:
	command -v  atril   2>/dev/null && atril vim_sheet.pdf &
	command -v  xreader 2>/dev/null && atril vim_sheet.pdf &
	@echo ">>>>> No PDF viewer found.....you are SOL"

doc: howto.md md.css
	pandoc -s -c md.css -f markdown -t html -o howto.html howto.md
