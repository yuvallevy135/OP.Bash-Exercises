#!/bin/bash
# Yuval levy 205781966

name=$1
arrName=( $name )
lenArrName="${#arrName[@]}"
re='^[0-9]+$'
total=0
foundFlag=1
filename=$2
while IFS= read -r line; do
	flag="1"
	lineArr=( $line ) # make an arr out of the line that we are reading.
	lenArrLine="${#lineArr[@]}"
	# check the first X words in that line. X= the length of out name.
	for (( c=0; c<$lenArrName; c++ ))
	do  
		if [ "${lineArr[c]}" != "${arrName[c]}" ]; then
			# if there is not a match then it isnt out name.
			flag="0"
			break
		fi
	done
	if [ $flag != "0" ]; then
			# if there is a match in the name, we want to check that the next word is a number, and not an extra name for the name in this line.
		if [[ "${lineArr[c]}" =~ $re ]] ; then # if its a number that means we found out name.
			((total=total+"${lineArr[c]}"))
			echo $line
			foundFlag="0"
		fi
	fi
done < $filename
if [[ "$foundFlag" == "0" ]] ; then # a flag to check that we found a name before in our check and we need to print something.
	echo "Total balance:" $total
fi
