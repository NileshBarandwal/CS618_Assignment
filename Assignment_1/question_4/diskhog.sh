#!/bin/bash

shopt -s dotglob # enable inclusion of hiddern files or folders and -u for diable
if [ -z "$(ls -A)" ]; then # check for empty file/folder. using -A exclude '.' and '..' which get using -a
	exit 0
fi

# here --max-depth=1 limits the du output to the top-level items in the current directory, which avoids including the size of subdirectories in the summary.
du -h --max-depth=1 * 2>/dev/null | sort -hr | head -n 5
