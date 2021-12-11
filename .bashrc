export PS1='\[\033[01;31m\]\h \[\033[01;32m\]\W\[\033[01;34m\]$(function _f(){ git $1 --short HEAD 2>/dev/null;}; (_f symbolic-ref || _f rev-parse) | sed -E "s/(.+)/ \1/")\[\033[01;36m\] \$ \[\033[0m\]'

alias gd="git diff"
alias goto=':;_f(){ git checkout ${1:-"main"} ${@:2}; };_f'
alias gs="git status"
alias gv="git log --oneline --all --decorate --graph"
alias gb='git branch'
alias gn=':;_f(){ git diff "$1" "$2" --name-only;}; _f'
alias gl=':;_f(){ git log --oneline -"$1";};_f'
alias dl=':;_f(){ docker logs --tail 10 -f "$1";};_f'

alias ll="ls -l -color=auto"
alias lf=':;_f(){ ls -ld ${1:-$PWD}/* ${1:-$PWD}/.[^.]* ${@:2} 2>/dev/null; };_f'
alias sc="source ~/.bashrc"
alias c="clear"

alias db='docker exec -it postgres /bin/sh'
alias redis='docker exec -it redis /bin/sh'

alias python="python3"
alias pip="pip3"

alias ...="cd $HOME/worker"
alias venv=':;_f(){ [[ "$VIRTUAL_ENV" == "" ]] && source $(pwd)/venv/bin/activate || deactivate;};_f'

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
