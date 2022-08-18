#!/bin/bash

# This is if we're in an interactive shell.
# Outputting things from .bashrc could cause things like
# sftp to fail to log in with "Received message too long"
# so we return if we're not.
[[ $- == *i* ]] || return

SCRIPT_DIR_a=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_DIR=$( realpath "$SCRIPT_DIR_a" )
# echo "$SCRIPT_DIR"

mount_info=$( cat /proc/self/mountinfo | grep -f <(df -h "$SCRIPT_DIR" | tail -n1 | awk '{print $1}') )


# echo "$mount_info"

printf "%s" "$mount_info" | awk '{print $9}' | grep -i 'nfs' > /dev/null

result=${PIPESTATUS[2]}
# echo "Result: $result"
if [[ "$result" == 0 ]]
then
	printf "WARNING: It's not wise for this stuff used on NFS.\n"
	printf "%s\n" "$SCRIPT_DIR"
fi
