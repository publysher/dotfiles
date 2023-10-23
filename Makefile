PACKAGES=zsh-completions


.PHONY:	all
all:	brew-packages ~/.zshrc ~/.gitconfig ~/.vimrc ~/.ssh/config

.PHONY:	brew-packages
brew-packages:	
	brew install $(PACKAGES)

~/%:	%
	ln -s $(abspath $<) $@
