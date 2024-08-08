#!/bin/bash

num=0

while read -r line; do
  
  value=$(echo "$line" | cut -d' ' -f1)
  operator=$(echo "$line" | cut -d' ' -f2)
   
  if ! [[ "$value" =~ ^-?[0-9]+$ ]]; then
	  echo "Error: Invalid value '$value' on line '$line'"
	  exit -1
  fi

  if ! [[ "$operator" =~ ^[\-\+\*/%]$ ]]; then
  	  echo "Error: Invalid operator '$operator' on line '$line'"
  	  exit -1
  fi

  prev_num=$num

  if [ "$operator" == "+" ]; then
    num=$((prev_num + value))
  elif [ "$operator" == "-" ]; then
    num=$((prev_num - value))
  elif [ "$operator" == "*" ]; then
    num=$((prev_num * value))
  elif [ "$operator" == "/" ]; then
    	  if [ "$value" -eq 0 ]; then
		  echo "Error: Divisible by zero. Invalid value '$value' on line '$line'"
		  exit -1
	  fi
	  num=$((prev_num / value))
  elif [ "$operator" == "%" ]; then
	  if [ "$value" -eq 0]; then
		  echo "Error: Modulo by zero. Invalid value '$value' on line '$line'"
		  exit -1
	  fi
    num=$((prev_num % value))
  fi

done < "$1"

echo "$num"
