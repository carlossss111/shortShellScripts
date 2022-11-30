#!/bin/bash
#List of custom aliases.
alias fullgcc='gcc -Wall -ansi -pedantic-errors -o'
alias condabash='bash --rcfile /home/daniel/.bashrc2'
alias cdl="cd \"$1\"; ls"
alias ll='ls -lh'
alias gamermode='PS1="$ ";clear'
yclip() {
	cat "$1" | xclip -selection c 
}
wcc(){
	echo -n "$1" | wc -c
}
alias gitlabToken='gpg -d ~/Repos/.tokens/gitlab.gpg'
alias githubToken='gpg -d ~/Repos/.tokens/github.gpg'
alias lightmode='darkmode'
alias c='clear'
