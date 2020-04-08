#!/bin/bash
# Yuval levy 205781966

# $1 = PATH, $2 = WORD.
filename=$1
word=$2
i=1 # counter
while IFS= read -r line; do #read each line 
x=$(echo "$line" | grep -iw $word <<<"$line" | wc -w) # if the exact word in line it saves the amount of words in line
if [ "$x" != "0" ]; #if x isnt 0, which means our word in line
then
echo $i $x # print number of line and number of words in line.
fi
((i=i+1))
done < $filename
