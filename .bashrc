export PS1='\[\033[01;31m\]\h \[\033[01;32m\]\W\[\033[01;34m\]$(function _f(){ git $1 --short HEAD 2>/dev/null;}; (_f symbolic-ref || _f rev-parse) | sed -E "s/(.+)/ \1/")\[\033[01;36m\] \$ \[\033[0m\]'

alias gd="git diff"
alias goto=':;_f(){ git checkout ${1:-"main"} ${@:2}; };_f'
alias gs="git status"
alias gv="git log --oneline --all --decorate --graph"
alias gb='git branch'
alias gn=':;_f(){ git diff "$1" "$2" --name-only;}; _f'
alias gl=':;_f(){ git log --oneline -"$1";};_f'
alias dl=':;_f(){ docker logs --tail 10 -f "$1";};_f'

alias ll="ls -l --color=auto"
alias lf=':;_f(){ ls -ld ${1:-$PWD}/* ${1:-$PWD}/.[^.]* ${@:2} 2>/dev/null; };_f'
alias sc="source ~/.bashrc"
alias c="clear"

# database settings
export POSTGRES_HOST=localhost
export POSTGRES_PASSWORD=postgres
export POSTGRES_USER=postgres
export POSTGRES_PORT=5432
export POSTGRES_DB=users
export LOCAL_DB_NAME=db

alias create-db="docker run --name db -itd --restart always \
-p ${POSTGRES_PORT}:5432 \
-e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -e POSTGRES_USER=${POSTGRES_USER} \
-e POSTGRES_PORT=5432 -e POSTGRES_DB=${POSTGRES_DB} \
postgres:16-alpine"

alias update-db='liquibase --url="jdbc:postgresql://localhost:${POSTGRES_PORT}/${POSTGRES_DB}" \
--username=${POSTGRES_USER} \
--password=${POSTGRES_PASSWORD} \
--changeLogFile=changelog.xml update'

alias delete-db="docker stop ${LOCAL_DB_NAME} && docker rm ${LOCAL_DB_NAME}"

alias create-dynamodb='docker run -itd --name dynamodb -p 8000:8000 amazon/dynamodb-local'
alias delete-dynamodb='docker stop dynamodb && docker rm dynamodb'
