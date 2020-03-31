PACKAGES=zsh-completions


.PHONY:	all
all:	brew-packages ~/.zshrc

.PHONY:	brew-packages
brew-packages:	
	brew install $(PACKAGES)

~/.zshrc:	.zshrc
	ln -s $(abspath $<) $@
