#!/bin/bash
echo "************************************************************************"
echo "********** Prueba Encoder # $1 $2 **********"
echo "************************************************************************"
./adb logcat -c
./adb shell stream_decode_test -i /data/$2 -f OMX.intel.avc.decoder -n 300 -o /data/avc$1.yuv
if [ $# = 5 ]; then
	./adb shell stream_encode_test -i /data/avc$1.yuv -o /data/avc$1.h264 -w $3 -h $4 -b $5 -g 1:1:0
else
	./adb shell stream_encode_test -i /data/avc$1.yuv -o /data/avc$1.h264 -w $3 -h $4 -g 1:1:0
fi
./adb shell stream_decode_test -i /data/avc$1.h264 -f OMX.intel.avc.decoder
filename=`echo encoder_$1.log`
./adb logcat -d >$filename
