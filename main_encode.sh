#!/bin/bash
i=1
c=encode.sh
n=`cat videos_avc.txt |wc -l`
while [ $i -le $n ]; do
	s=`sed -n "$i"p videos_avc.txt`
	a=( $s )
	echo ${a[3]}
	if [ -n ${a[3]} ]; then
		./$c $i ${a[0]} ${a[1]} ${a[2]} ${a[3]}
	else
		./$c $i ${a[0]} ${a[1]} ${a[2]}
	fi
	i=`expr $i + 1`
done
