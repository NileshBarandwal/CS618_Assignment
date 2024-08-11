#!/bin/bash

dir_name=$1
n=$2

if [ "$#" -ne 2 ]; then
	echo "usage: $0 <dir> <n>" 1>&2
	exit 1;
fi

if ! [ -d "$dir_name" ]; then
	echo "ERROR: input '$dir_name' is not a directory." 1>&2
	exit 1;
fi

find "$dir_name" -type f -size +"$n"c -exec rm {} \;

