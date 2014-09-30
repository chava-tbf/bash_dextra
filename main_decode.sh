#!/bin/bash
i=1
c=decode.sh
if [ $1 = "imagen" ]; then
	n=`cat imagen.txt|wc -l`
	while [ $i -le $n ]; do
		s=`sed -n "$i"p imagen.txt`
		a=( $s )
		if [ $2 = "yuv" ]; then
			./$c imagen $i ${a[0]} ${a[1]} ${a[2]}
		else
			./$c imagen $i ${a[0]}
		fi
		i=`expr $i + 1`
	done
else
	n=`cat videos_$1.txt |wc -l`
	while [ $i -le $n ]; do
		s=`sed -n "$i"p videos_$1.txt`
		a=( $s )
		if [ $2 = "yuv" ]; then
			./$c $1 $i ${a[0]} ${a[1]} ${a[2]}
		else
			./$c $1 $i ${a[0]}
		fi
		i=`expr $i + 1`
	done
fi
