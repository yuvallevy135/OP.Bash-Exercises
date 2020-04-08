#!/bin/bash
# Yuval levy 205781966

i=1; #counter
cd $1
#ls
for f in $(ls); do
    if [[ $f == *".txt"* ]]; then # run over all file that are txt files.
          echo $i $f "is a file"
	((i=i+1))
    fi
done
for f in $(ls); do
    if [ -d "$f" ]; then # go over all files that are directories.
        echo $i $f "is a directory"
	((i=i+1))
    fi
done
