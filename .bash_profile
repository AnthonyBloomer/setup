EDITOR=vim

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias pyserve='python -m SimpleHTTPServer 8000'
alias phpserve='php -S localhost:8080'
alias newenv='virtualenv env && source env/bin/activate'
alias newpy3env='virtualenv -p python3 env && source env/bin/activate'

md() { 
    mkdir -p "$@" && cd "$@"; 
}

cl() { 
    cd "$@" && ls; 
}

gc() {
    git clone $1 && cd $(basename $1 .git)
}

mp3() {
    youtube-dl --extract-audio --audio-format mp3 $1
}

dc() {
    docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)
}

convert-rst(){
    input=$1
    output=$2
    pandoc --from=markdown --to=rst --output=$output $input
}

convert-md(){
    input=$1
    output=$2
    pandoc --from=rst --to=markdown --output=$output $input
}

merge-master(){
    git fetch --all
    git merge origin/master
    git push
}

if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;
