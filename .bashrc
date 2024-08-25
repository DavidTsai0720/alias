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

alias venv=':;_f() { [ ! -d ./venv ] && python -m venv venv; [ !-z "$VIRTUAL_ENV" ] && deactivate || source venv/bin/activate; };_f'

function py-check() {
    black --line-length=120 "$1"
    autopep8 --in-place --experimental --max-line-length=120 "$1"
    isort --line-lenght=120 "$1"
    flake8 --ignore=E501,W503 "$1"
    pylint $1
}

# database settings
export POSTGRES_HOST=localhost
export POSTGRES_PASSWORD=postgres
export POSTGRES_USER=postgres
export POSTGRES_PORT=5432
export POSTGRES_DB=users
export LOCAL_DB_NAME=db
export CHANGE_LOG="changelog.xml"

alias create-db="docker run --name ${LOCAL_DB_NAME} -itd --restart always \
-p ${POSTGRES_PORT}:5432 \
-e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} -e POSTGRES_USER=${POSTGRES_USER} \
-e POSTGRES_PORT=5432 -e POSTGRES_DB=${POSTGRES_DB} \
postgres:16-alpine"

alias update-db='liquibase --url="jdbc:postgresql://${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}" \
--username=${POSTGRES_USER} \
--password=${POSTGRES_PASSWORD} \
--changeLogFile=${CHANGE_LOG} update'

alias delete-db="docker stop ${LOCAL_DB_NAME} && docker rm ${LOCAL_DB_NAME}"

alias create-dynamodb='docker run -itd --name dynamodb -p 8000:8000 amazon/dynamodb-local'
alias delete-dynamodb='docker stop dynamodb && docker rm dynamodb'

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# [[ -s "/home/david/.gvm/scripts/gvm" ]] && source "/home/david/.gvm/scripts/gvm"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init --path)"
# fi
