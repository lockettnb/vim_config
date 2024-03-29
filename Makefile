#
# 2016/01/08 created
# 2016/02/03 added first script
# 2019/11/08 added VIM as install directory
# 2024/01/14 added movehelper script
#

VIM=$(HOME)/.vim
PLUGIN=$(VIM)/ftplugin

CHEAT=vim_sheet.md
CONF = vimrc.txt
# SCRIPTS = tognums.vim
SCRIPTS = snip.vim quotes.vim toggle.vim toggle_netrw.vim movehelper.vim


all: vim

vim:
	cp $(CONF) $(HOME)/.vimrc
	mkdir -p $(VIM)
	mkdir -p $(PLUGIN)
	cp cheat/$(CHEAT) $(VIM)
	cp ./scripts/snip.vim $(VIM)
	cp ./scripts/quotes.vim $(VIM)
	cp ./scripts/toggle.vim $(VIM)
	cp ./scripts/toggle_netrw.vim $(VIM)
	cp ./scripts/imgls.vim $(PLUGIN)
	cp ./scripts/clip.vim $(VIM)
	cp ./scripts/boxie.vim $(VIM)
	cp ./scripts/movehelper.vim $(VIM)

remove:
	rm $(VIM)/$(CHEAT)
	rm $(VIM)/*.vim
	rm $(HOME)/.vimrc
