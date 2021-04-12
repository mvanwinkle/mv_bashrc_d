#!/bin/bash

script_dir=$(realpath $( dirname "$0" ) )

if [[ -e ~/.bashrc.d ]]
then
	>&2 echo "~/.bashrc.d already exists.  Exiting."
	exit 1
fi

echo "Script dir: $script_dir"
two_up=$(basename $( dirname "$script_dir"))
etc_dir=""
echo "2 up: $two_up"

if [[ "$two_up" == "src" ]]
then
	etc_dir=$(realpath "${script_dir}"/../etc)
	root_etc_dir=$(realpath "${script_dir}"/../root_etc/IAS/mv-bashrc-d)
else
	artifact_name=$(basename "$script_dir")
	etc_dir=$(realpath "${script_dir}/../../etc/${artifact_name}")
	root_etc_dir="/etc/IAS/${artifact_name}/"
fi

echo "etc_dir: $etc_dir"
echo "root_etc_dir: $root_etc_dir"

ln -s "${root_etc_dir}" ~/.bashrc.d
cat "${etc_dir}/bashrc" >> ~/.bashrc

