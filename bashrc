#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ll='ls -l'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias s76='sudo system76-power'
alias githubToken='gpg -d ~/.tokens/github.gpg'
alias irc='irssi'

# Prompt
# Backup: PS1='[\u@\h \W]\$ '
function getParent(){
local parentDir=$(basename "$(dirname `pwd`)")
if [ "$parentDir" = $(whoami) ];then
	echo -n "~/"
elif [ $(pwd) = '/' ] || [ "$parentDir" = "home" ]; then
	echo -n ""
elif [ "$parentDir" = '/' ]; then
	echo -n "/"
else
	echo -n "$parentDir/"
fi
}
PS1="\h | \[\e[1;93m\]\`getParent\`\W $ \[\e[m\]"
export PS1

# Misc
. "$HOME/.cargo/env" #enables rust env
. /opt/asdf-vm/asdf.sh #enables proton GE manager
