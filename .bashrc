PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin 

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Completion for RVM
[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion"

# This loads NVM
[[ -s /Users/chris/.nvm/nvm.sh ]] && . /Users/chris/.nvm/nvm.sh 

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_describe () {
      git diff-tree --no-commit-id --name-only -r "$@";
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$RED\$(~/.rvm/bin/rvm-prompt i v g)$GREEN \w$YELLOW\$(parse_git_branch)$NO_COLOUR "

# Postgres
export PGDATA=/usr/local/pgsql/data

export HISTFILESIZE=5000

alias ls="ls -latrG"
alias webserve="python -m SimpleHTTPServer"
alias gitdescribe=git_describe 
