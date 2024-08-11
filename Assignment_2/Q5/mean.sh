#!/bin/bash

if [ "$#" -ne 2 ] || [ "$#" -lt 1 ]; then
    echo "usage: $0 <column_number> [file.csv]" 1>&2
    exit 1
fi

if ! [ -f "$2" ]; then
	echo "File Not Found" 1>&2
	exit 1
fi

my_sum=0
count=0

column=$1
file="${2:-/dev/stdin}"

values=$(cut -d',' -f"$column" "$file" | tail -n +2)

for value in $values
do
    my_sum=$(echo "$my_sum + $value" | bc)
    ((count++))
done

if [[ $count -gt 0 ]]; then
    mean_value=$(echo "scale=2; $my_sum / $count" | bc)
    echo "The Mean of column '$column' is : $mean_value"
else
    echo "This List is empty, cannot calculate the Mean."
fi

