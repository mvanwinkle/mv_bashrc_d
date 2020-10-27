#!/bin/bash

# Hide certain things from the greps
alias fgrep='fgrep --exclude-dir=".svn" --exclude-dir=".git"'
alias grep='grep  --exclude-dir=".svn" --exclude-dir=".git"'
alias egrep='egrep  --exclude-dir=".svn" --exclude-dir=".git"'
