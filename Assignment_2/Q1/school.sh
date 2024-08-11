#!/bin/bash

cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOL" | \
cut -d',' -f7 | \
awk '{sum += $1; count++} END {if (count > 0) printf "%.2f\n", sum / count; else print "No data for MADISON SCHOOLS"}'

