#!/bin/bash

export PS1='\u@\h \W/ $ '
export EDITOR='vim'

alias u='cd .. ; ls'

function d
{
	cd "$1"
	ls
}
