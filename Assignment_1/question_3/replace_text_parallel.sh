#!/bin/bash
dir="$1"
search="$2"
replace="$3"

if [ "$#" -ne 3 ]; then
	echo "$0 /path/to/directory \"search_string\" \"replacement_string\""
	exit 1
fi

if [ ! -d "$dir" ]; then
	echo "Directory $dir doesn't exist."
	exit 1
fi

if [ ! -r "$dir" ]; then
	echo ":Directory $dir is not readable."
	exit 1
fi

# parallel : run multi job concurrently
# sed -i "s/$search/$replace/g"
# -i = This command replaces old_text with new_text in file.txt directly. Without -i, the changes would only be shown on the terminal# s/: Stands for "substitute" and is used to indicate that you want to perform a replacement operation.
# /g: Stands for "global" and tells sed to replace all occurrences of the pattern on each line, not just the first one.

find "$dir" -type f -name '*.txt' | parallel sed -i "s/$search/$replace/g"

echo "Replacement Complete"
