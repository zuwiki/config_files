# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

export EDITOR='vim'

# aliases
if [[ -e "$HOME/.aliases" ]]; then
  source "$HOME/.aliases"
fi

# extra paths
if [[ -e "$HOME/.paths" ]]; then
  source "$HOME/.paths"
fi

# vi mode
bindkey -v

# use incremental search
bindkey ^R history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

# look for ey config in project dirs
export EYRC=./.eyrc

if (( $+commands[rbenv] )); then
    eval "$(rbenv init - )"
fi

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

# autocompletion for ruby_test
# works with tu/tf aliases
_ruby_tests() {
  if [[ -n $words[2] ]]; then
    compadd `ruby_test -l ${words[2]}`
  fi
}
compdef _ruby_tests ruby_test

# autocompletion for ruby_spec
# works with sm/sc aliases
_ruby_specs() {
  if [[ -n $words[2] ]]; then
    compadd `ruby_spec -l ${words[2]}`
  fi
}
compdef _ruby_specs ruby_spec

# autocompletion for ruby_tu_rs
# works with su/sf aliases
_ruby_mixed_tests() {
  if [[ -n $words[2] ]]; then
    compadd `ruby_tu_rs -l ${words[2]}`
  fi
}
compdef _ruby_mixed_tests ruby_tu_rs

_git_remote_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    if (( CURRENT == 2 )); then
      # first arg: operation
      compadd track remote_add remote_rm rm push mv new pull
    elif (( CURRENT == 3 )); then
      if [[ $words[2] == "push" ]]; then
        # second arg: local branch name
        compadd `git branch -l | sed "s/[ \*]//g"`
      else;
        # second arg: remote branch name
        compadd `git branch -r | grep -v HEAD | sed "s/.*\///" | sed "s/ //g"`
      fi
    elif (( CURRENT == 4 )); then
      # third arg: remote name
      compadd `git remote`
    fi
  else;
    _files
  fi
}
compdef _git_remote_branch grb

# autocompletion for schema
_rails_tables() {
  if [[ -n $words[2] ]]; then
    compadd `schema -l ${words[2]}`
  fi
}
compdef _rails_tables schema

# autocompletion for cuc
_cucumber_features() {
  compadd `ls features/**/*.feature | sed "s/features\/\(.*\).feature/\1/"`
}
compdef _cucumber_features cuc

# restore previous cwd
if [[ -f ~/.last_cwd ]]; then
  cd "`cat ~/.last_cwd`"
fi
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )

