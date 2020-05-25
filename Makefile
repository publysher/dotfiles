PACKAGES=zsh-completions


.PHONY:	all
all:	brew-packages ~/.zshrc ~/.gitconfig

.PHONY:	brew-packages
brew-packages:	
	brew install $(PACKAGES)

~/%:	%
	ln -s $(abspath $<) $@
