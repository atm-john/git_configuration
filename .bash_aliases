os=`uname -s`

if [[ $os == "Linux" ]]; then
    git_completion="/etc/bash_completion.d/git-prompt"
else
    unset git_completion
fi

if [[ "$git_completion" ]]; then
    if [ -f $git_completion ]; then
           export GIT_PS1_SHOWDIRTYSTATE=true
           export GIT_PS1_SHOWUNTRACKEDFILES=true
           export GIT_PS1_SHOWSTASHSTATE=true          
           PS1="$PS1\$(__git_ps1 '(\[\e[31;1m\]%s\[\e[0m\]) ')"
    fi
fi

alias lsgitremote='paste  <(for i in *; do if [ -d "$i"/.git ] ; then echo -e "git clone -b \033[1;31m$(git --git-dir="$i"/.git symbolic-ref --short HEAD)\033[0m $(git  --git-dir="$i"/.git  config --get remote.origin.url) $i"; else echo; fi; done)'
