#!/bin/bash

#check for the correct No. of arguments. -ne not equal
if [ "$#" -ne 3 ]; then
	echo "$0 <directory_path> <prefix> <recursive>"
	exit -1 # if not exit then it will go on execute below code along with above echo msg
fi

# Arguments
directory_path="$1"
prefix="$2"
recursive="$3"

# Ensure directory_path does not have trailing slashes
directory_path=$(echo "$directory_path" | sed 's:/*$::') #--

if [ "$recursive" != "true" ] && [ "$recursive" != "false" ]; then
	echo "recursive should take only true or false values"
	exit -1
fi

# Valid dir path, check if dir exist or not
if [ ! -d "$directory_path" ]; then
	echo "$directory_path is not a valid directory"
	exit -1
fi	

# Handle "" , -z if a string is empty and -n if string is nonempty

if [ -z "$prefix" ]; then
	pattern=".*\.txt"
else
	pattern="${prefix}.*\.txt" # {}* to find all matching files
fi

if [ "$recursive" = "true" ]; then
  #find_command="find \"$directory_path\" -type f -name '${prefix}.txt'"
  ls_cmd="ls -R \"$directory_path\""
else
  #find_command="find \"$directory_path\" -maxdepth 1 -type f -name '${prefix}.txt'"
  ls_cmd="ls \"$directory_path\"" 
fi

# Execute the find command and count the number of files
#file_count=$(eval "$find_command" | wc -l)

file_count=$(eval "$ls_cmd" | grep "$pattern" | wc -l)

echo "$file_count"

