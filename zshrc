# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use TextMate as an editor
export EDITOR='mate -w'

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# extra paths
if [ -e "$HOME/.paths" ]; then
  source "$HOME/.paths"
fi

# vi mode
bindkey -v

# use incremental search
bindkey ^R history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

# look for ey config in project dirs
export EYRC=./.eyrc

