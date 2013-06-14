#! /bin/bash

TEMP=`pwd`/tmp.$$$$

du -sh

for LOOP in *
do
	if [ -d "$LOOP" ]
	then
		cd "$LOOP"
		echo -n "$LOOP" ";">>$TEMP
		du -sh>>$TEMP
		cd ..
	elif [ -f "$LOOP" ]
	then
		echo -n $LOOP ";">>$TEMP
		ls -lh $LOOP | awk '{print $5}'>>$TEMP
	fi
	shift
done

sort -t ';' -k2 -h -r $TEMP

rm $TEMP
