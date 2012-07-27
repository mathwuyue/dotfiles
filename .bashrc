 #source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Custom PS1

PS1='`a=$?;if [ $a -ne 0 ]; then a=""$a; echo -ne "\[\e[s\e[1A\e[$((COLUMNS-2))G\e[31m\e[1;41m${a:(-3)}\e[u\]\[\e[0m\e[7m\e[2m\e"; fi`\[\e[0;32m\]\u@\h:\[\e[0m\e[0;34m\]\W\[\e[0;32m\]\$ \[\e[0m\]'

# User specific aliases and functions
alias cp='cp -i'
alias df='df -h'
alias h='history | tail'
alias chx='chmod +x'
alias lt='ls -ltrh | tail'
alias rm='rm -i'
alias dirs='dirs -p -v'
alias cdpj='cd /home/lowstz/project'
alias cddown='cd /home/lowstz/Downloads'
alias cddoc='cd /home/lowstz/Documents'
alias cddp='cd /home/lowstz/Dropbox'
alias sshvps='ssh -p 2222 lowstz@lowstz.org'
alias gowiki='cd ~/Dropbox/org/wiki'
alias todo="ec ~/Dropbox/org/plan/todo.org"
alias ec='emacsclient -c'
alias open="xdg-open"

alias jt='xfce4-screenshooter'
#editor
export TERM=xterm-256color
export EDITOR='emacsclient -c'


# locale setting
export LC_MESSAGES=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'


#if [ $TERM = "xterm" ]; then
#	export LC_MESSAGES=C
#fi

#Program Path
export PYTHONPATH="/home/lowstz/Project/swampy-2.0"

# functions

# translate using youdao api
ts(){
words=""
for word in $@; 
do
    words="$words$word "
done

echo $words

curl -s \
        "http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&smartresult=ugc&sessionFrom=dict.top" \
     -d \
    "type=AUTO&i=$words&doctype=json&xmlVersion=1.4&keyfrom=fanyi.web&ue=UTF-8&typoResult=true&flag=false" \
        | sed -E -n 's/.*tgt":"([^"]+)".*/\1/p' ;

return 0;
}

PATH=$PATH:$HOME/.rvm/bin:$HOME/.local/bin/go/bin  # Add RVM to PATH for scripting

