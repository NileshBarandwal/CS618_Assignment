#!/bin/bash

# Get the current working directory and append "/ten" to it
TARGET_DIR="$(pwd)/ten"

# Create the target directory
mkdir -p "$TARGET_DIR"

# The -w option pads numbers with leading zeros so that all numbers have the same width (e.g., 01, 02, ..., 10).
for i in $(seq -w 1 10)
do
    # Define the directory name with the target path
    DIR_NAME="$TARGET_DIR/dir$i"

    # Create the directory
    mkdir -p "$DIR_NAME"

    for file_num in $(seq 1 4)
    do
        FILE_NAME="$DIR_NAME/file$file_num.txt"
        touch "$FILE_NAME"
        for ((line=1; line<=file_num; line++))
        do
            echo "$file_num" >> "$FILE_NAME"
        done
        echo "File '$FILE_NAME' created."
    done

    # Optional: Print a message confirming the creation
    echo "Directory '$DIR_NAME' created."
done

