﻿# write a function to compute the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# bash_completion
if [[ -s "/usr/local/Cellar/git/1.7.3.2/etc/bash_completion.d/git-completion.bash" ]]; then
source "/usr/local/Cellar/git/1.7.3.2/etc/bash_completion.d/git-completion.bash"
fi

# rvm
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
source "$HOME/.rvm/scripts/rvm"
fi

# iterm2 tab title
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
# set the PS1 variable
PS1="\w\[\e[0;33;49m\]\$(parse_git_branch)\[\e[0;0m\]$ "

## aliases
# system
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -kh'     
alias df='df -kTh'
alias tlf="tail -f"
alias ll="ls -l"
#rails aliases
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias rspec="bundle exec rspec"
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"
#misc
alias g="git"
alias gaa='git add --all'

export NODE_PATH="/usr/local/lib/node"
export VIMRC="~/.vimrc"
export PATH="/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export CLICOLOR=1
export TERM=xterm-color
export EDITOR=vim
