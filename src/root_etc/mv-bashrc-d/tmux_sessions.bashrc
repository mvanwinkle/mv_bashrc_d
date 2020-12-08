#!/bin/bash

# This is if we're in an interactive shell.
# Outputting things from .bashrc could cause things like
# sftp to fail to log in with "Received message too long"
# so we return if we're not.
[[ $- == *i* ]] || return

# If we're not in a TMUX session
if [ -z ${TMUX+x} ]
then
    # And if TMUX is in our path
    tmux_sessions=`\
        which tmux 2>/dev/null 1>/dev/null \
        && tmux ls 2>/dev/null \
    `
    result=$?
    if [[ $result == "0" ]]
    then
        echo "### TMUX Sessions:"
        echo "$tmux_sessions" | awk '{print "# "$0}'
    fi
fi

