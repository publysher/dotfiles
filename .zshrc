# from zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
fi

# customize prompt
autoload -Uz vcs_info
autoload -U colors && colors

# turn off globbing warnings
setopt rm_star_silent

precmd() {
	local __user="%n"
	local __host="%m"
	local __cwd="%0~"
	local __hash="%#"
	local __newline=$'\n'

	local git_branch="%{$fg[green]%}%b%{$reset_color%}"
	local git_action="%a"
	local git_stash="%m"
	local git_unstaged="%u"
	local git_staged="%c"

	zstyle ':vcs_info:*' check-for-changes true
	zstyle ':vcs_info:*' stagedstr " *"
	zstyle ':vcs_info:*' unstagedstr " *"
	zstyle ':vcs_info:git*' formats "(${git_branch}${git_stash}${git_unstaged}${git_staged})"
	zstyle ':vcs_info:git*' actionformats "(${git_branch}${git_stash}${git_unstaged}${git_staged}) (${git_action})"
	vcs_info

	PROMPT="${__newline}${__user}@${__host} ${__cwd} ${vcs_info_msg_0_}${__newline}${__hash} "
}

# load API keys etc
if [[ -f ~/.secrets ]] 
then
	source ~/.secrets
fi

# to make sure ansible/hvac work nice
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# NVM shit
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# private repos
export GOPRIVATE=github.com/door2doc/*


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
