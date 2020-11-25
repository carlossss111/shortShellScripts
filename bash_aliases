#!/bin/bash
#List of custom aliases.
alias fullgcc='gcc -Wall -ansi -pedantic-errors -o'
cdl() {
	cd "$1" && ls;
}
