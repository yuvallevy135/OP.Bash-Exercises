#!/bin/bash
# Yuval levy 205781966

i=1;
FILE=$0/$1
dirOrFile=$1
dirFlag=1
if [ -d "$1" ]; then
	cd $1
	dirOrFile=$2
fi

for f in $(ls); do
	if [ -d "$f" ]
	then #d check if its a directory and need to check inside
		cd $f # change to that directory
		for t in $(ls); do
			if [ ! -d "$t" ] && [ $t == $dirOrFile ] # if its not a directory and its our file.
			then
				cat "$t"; echo #print what's inside the file
			fi
		
		done
		cd ..
	else
		if [ $dirOrFile == $f ] # if it wasnt a directory check if its the file that we are looking for.
		then
			cat "$f"; echo #if it is print it.
		fi
	fi
done
