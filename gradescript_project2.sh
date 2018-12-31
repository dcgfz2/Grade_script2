#!/bin/bash

unzip submissions.zip -d submissions

for file in submissions/*
do
    	fixedname="$(find $file | sed 's/^[^_]*_[^_]*_[^_]*_//g' | sed 's/-[0-9]*//g')"
    	correctflag=0

    	mv "$file" "$fixedname"

    	g++ "$fixedname"

    	if [ "$(a.out 10 5)" = "252" ]; then
       	correctflag=1
    	fi

    	submitter="$(echo $fixedname | sed 's/.cpp//g')"
    	if [ "$correctflag" = 1 ]; then
            	echo "$submitter, correct" >> grades.txt
    	else
            	echo "$submitter, incorrect" >> grades.txt
    	fi
done
