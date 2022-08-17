PACKAGES=zsh-completions


.PHONY:	all
all:	brew-packages ~/.zshrc ~/.gitconfig ~/.vimrc

.PHONY:	brew-packages
brew-packages:	
	brew install $(PACKAGES)

~/%:	%
	ln -s $(abspath $<) $@
