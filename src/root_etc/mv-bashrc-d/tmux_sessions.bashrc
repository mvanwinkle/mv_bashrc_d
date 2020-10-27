#!/bin/bash

# If we're not in a TMUX session
if [ -z ${TMUX+x} ]
then
    # And if TMUX is in our path
    tmux_sessions=`\
        which tmux 1>/dev/null \
        && tmux ls 2>/dev/null \
    `
    result=$?
    if [[ $result == "0" ]]
    then
        echo "### TMUX Sessions:"
        echo "$tmux_sessions" | awk '{print "# "$0}'
    fi
fi

