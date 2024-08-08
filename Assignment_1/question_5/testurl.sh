#!/bin/bash

file=$1

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <file_with_urls>"
	exit 1
fi

# -f : check if file exist
if [ ! -f "$file" ]; then
	echo "File not Found: $file">&2
	exit 1
fi

# while IFS= read -r url; do # IFS ensures that entry line get printed including any leanding or trailing spaces and read without trimming

# Sends an HTTP request to the URL stored in the variable url.
# Discards the response body by directing it to /dev/null.
# Operates silently without showing progress or error messages.
# Captures only the HTTP status code from the response.
# Stores the captured HTTP status code in the variable status_code.

while read -r url; do
	status_code=$(curl -o /dev/null -s  -w "%{http_code}" "$url") 

	if [ "$status_code" -ne 200 ]; then
		echo "Not found: $url"
		exit 1
	else
		echo "Working : $url"
	fi

done < "$file"
