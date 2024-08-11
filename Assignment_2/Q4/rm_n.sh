#!/bin/bash

dir_name=$1
n=$2

# Check if the number of arguments is exactly 2
if [ "$#" -ne 2 ]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
fi

# Check if the provided directory exists and is indeed a directory
if ! [ -d "$dir_name" ]; then
    echo "ERROR: input '$dir_name' is not a directory." 1>&2
    exit 1
fi

# Check if the size argument is a positive integer
if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -le 0 ]; then
    echo "ERROR: size '$n' is not a positive integer." 1>&2
    exit 1
fi

# Find and delete files larger than the specified size
# c specifies bytes. If you need to specify sizes in kilobytes, megabytes, etc., you can use k, M, G, etc.

# specify n is in bytes
find "$dir_name" -type f -size +"$n"c -print -exec rm -v {} \;

echo "Deletion completed."
