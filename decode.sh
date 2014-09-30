#!/bin/bash
echo "************************************************************************"
echo "********** Prueba Decoder $1 $2 $3 **********"
echo "************************************************************************"
./adb logcat -c
if [ $1 = imagen ]; then
	if [ $# = 3 ]; then
		./adb shell stream_decode_test -i /data/$3 -f OMX.intel.jpeg.decoder -t 10
	else
		./adb shell stream_decode_test -i /data/$3 -f OMX.intel.jpeg.decoder -o /data/$1$2.yuv
		./adb pull /data/$1$2.yuv
		mplayer -demuxer rawvideo -rawvideo w=$4:h=$5:format=i420 $1$2.yuv -loop 60
	fi
else
	if [ $# = 3 ]; then
		./adb shell stream_decode_test -i /data/$3 -f OMX.intel.$1.decoder
	else
		./adb shell stream_decode_test -i /data/$3 -f OMX.intel.$1.decoder -n 300 -o /data/$1$2.yuv
		./adb pull /data/$1$2.yuv
		mplayer -demuxer rawvideo -rawvideo w=$4:h=$5:format=i420 $1$2.yuv
	fi
fi
filename=`echo decoder_$1$2.log`
./adb logcat -d >$filename
