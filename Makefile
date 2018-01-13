#
# 2016/01/08 created
# 2016/02/03 added first script
#

CHEAT=vim_sheet.md
CONF = vimrc.txt
# SCRIPTS = tognums.vim


all: vim

vim:
	cp $(CONF) $(HOME)/.vimrc
	cp cheat/$(CHEAT) $(HOME)/.vim/$(CHEAT)

remove:
	rm $(HOME)/.vimrc
	rm $(HOME)/.vim/$(CHEAT)

