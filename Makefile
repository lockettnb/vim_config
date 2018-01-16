#
# 2016/01/08 created
# 2016/02/03 added first script
#

CHEAT=vim_sheet.md
CONF = vimrc.txt
# SCRIPTS = tognums.vim
SCRIPTS = snip.vim quotes.vim toggle.vim


all: vim

vim:
	cp $(CONF) $(HOME)/.vimrc
	cp cheat/$(CHEAT) $(HOME)/.vim/$(CHEAT)
	cp ./scripts/snip.vim $(HOME)/.vim/
	cp ./scripts/quotes.vim $(HOME)/.vim/
	cp ./scripts/toggle.vim $(HOME)/.vim/

remove:
	rm $(HOME)/.vimrc
	rm $(HOME)/.vim/$(CHEAT)

