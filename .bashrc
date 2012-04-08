 #source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

#alias jt='xfce4-srceenshooter'
#editor
export TERM=xterm-256color
export EDITOR="/usr/bin/emacsclient -c"

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
