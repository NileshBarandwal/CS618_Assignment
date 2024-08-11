#!/bin/bash

# Initialize variables
total_value=0
count=0

# Read the CSV file line by line
while IFS= read -r line
do
    # Extract the 20th and 7th columns using cut
    col20=$(echo "$line" | cut -d',' -f20)
    col7=$(echo "$line" | cut -d',' -f7)
    
    # Trim any surrounding quotes or spaces from the 20th column
    col20=$(echo "$col20" | sed 's/^"//;s/"$//;s/^ *//;s/ *$//')

    # Check if the 20th column is "MADISON SCHOOL"
    if [[ "$col20" == "MADISON SCHOOL" ]]; then
        # Add the value in the 7th column (TotalAssessedValue) to the total
        total_value=$((total_value + col7))
	echo "$total_value + $count"
        # Increment the count
        ((count++))
    fi
done < Property_Tax_Roll.csv

# Calculate the average if count is greater than 0
if [[ $count -gt 0 ]]; then
    average_value=$((total_value / count))
    echo "Average Total Assessed Value for MADISON SCHOOL: $average_value"
else
    echo "MADISON SCHOOL not found in the CSV file."
fi
