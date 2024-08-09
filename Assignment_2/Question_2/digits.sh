#!/bin/bash

range=$(seq 1 20)
#seq 1000 2000 | grep "2" | wc -l
count=$(echo "$range" | grep -o '[2]' | wc -l)

echo "Number containing '2': $count"
