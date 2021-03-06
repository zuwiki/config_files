# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunken_oats"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

setopt auto_cd
setopt histignoredups

# aliases
if [[ -e "$HOME/.aliases" ]]; then
  source "$HOME/.aliases"
fi

# extra paths
if [[ -e "$HOME/.paths" ]]; then
  source "$HOME/.paths"
fi

#if (( $+commands[rbenv] )); then
#    eval "$(rbenv init - )"
#fi

# restore previous cwd
cdl() {
    if [[ -f ~/.last_cwd ]]; then
      cd "`cat ~/.last_cwd`"
    fi
}
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )
cdl
alias cdl='nocorrect cdl'

export EDITOR='vim'

# thanks Jeroen Janssens (http://jeroenjanssens.com/)
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | awk '{gsub("@ -", "\t-",$0); print;}' && echo
}

