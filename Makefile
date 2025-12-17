#
# 2016/01/08 created
# 2016/02/03 added first script
# 2019/11/08 added VIM as install directory
# 2024/01/14 added movehelper script
# 2025/12/17 changing vimrc and scripts locations, cleaner look and feel
# 2025/12/17 deleted "remove" target, added "help target

# install directories
VIM=$(HOME)/.vim
SCRIPT_DIR=$(VIM)/scripts
PLUG_DIR=$(VIM)/ftplugin

CHEAT=cheat/vim_sheet.md
CONF = vimrc.txt
SCRIPTS = snip.vim quotes.vim toggle.vim toggle_netrw.vim movehelper.vim clip.vim
PLUGS = imgls.vim

# scripts and plugins source assumed to be in "scripts" directory
SCRIPT_SCR = $(addprefix scripts/, $(SCRIPTS))
PLUG_SCR   = $(addprefix scripts/, $(PLUGS))

all: vim

vim:
	mkdir -p $(VIM)
	mkdir -p $(SCRIPT_DIR)
	mkdir -p $(PLUG_DIR)
	cp $(CONF) $(VIM)/vimrc
	cp $(CHEAT) $(VIM)
	cp $(SCRIPT_SCR) $(SCRIPT_DIR)
	cp $(PLUG_SCR) $(PLUG_DIR)


#	cp ./scripts/snip.vim $(SCRIPT_DIR)
#	cp ./scripts/quotes.vim $(SCRIPT_DIR)
#	cp ./scripts/toggle.vim $(SCRIPT_DIR)
#	cp ./scripts/toggle_netrw.vim $(SCRIPT_DIR)
#	cp ./scripts/clip.vim $(SCRIPT_DIR)
#	cp ./scripts/boxie.vim $(SCRIPT_DIR)
#	cp ./scripts/movehelper.vim $(SCRIPT_DIR)
#	cp ./scripts/imgls.vim $(PLUGIN)

help:
	@echo "VIM    target directory: $(VIM)"
	@echo "SCRIPT target directory: $(SCRIPT_DIR)"
	@echo "PLUGIN target directory: $(PLUG_DIR)"
	@echo "Scripts:"
	@echo "  $(SCRIPT_SCR)"
	@echo "Plugins:"
	@echo "  $(PLUG_SCR)"

