#!/bin/sh
i=1

while [ $i -le 10000 ]
do
  sleep 3
  echo "**************************************************** Round $i *****************************************************************"
  ./adb shell stream_decode_test -i/data/AV_TheAvengers_1080p_60fps_H264_ACC_LC_20mbps_HighProfile.mp4 -f OMX.intel.avc.decoder
  i=`expr $i + 1`
  
done
#./adb logcat -d >newfile.log
