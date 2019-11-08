#
# 2016/01/08 created
# 2016/02/03 added first script
# 2019/11/08 added VIM as install directory
#

VIM=$(HOME)/.vim

CHEAT=vim_sheet.md
CONF = vimrc.txt
# SCRIPTS = tognums.vim
SCRIPTS = snip.vim quotes.vim toggle.vim


all: vim

vim:
	cp $(CONF) $(HOME)/.vimrc
	mkdir -p $(VIM)
	cp cheat/$(CHEAT) $(VIM)
	cp ./scripts/snip.vim $(VIM)
	cp ./scripts/quotes.vim $(VIM)
	cp ./scripts/toggle.vim $(VIM)

remove:
	rm $(VIM)/$(CHEAT)
	rm $(VIM)/*.vim
	rm $(HOME)/.vimrc
