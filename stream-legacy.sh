#!/bin/sh

# If running on boot,
# wait for the pi to establish internet connection
# sleep 60

# set camera variables
. ./camera_info #/home/pi/camera/camera_info

# check for internet by pingin rtmp server
ping -c 2 "google.com"

# stream if internet connection established
if [ $? != 0 ] 
  then
    echo "There is no internet cennection"
  else
    # run updates if running on boot
    # sudo apt-get update
    # sudo apt-get upgrade
    echo "Starting stream"
    # start stream
    raspivid -t 0 -w $STREAM_WIDTH -h $STREAM_HEIGHT -fps $STREAM_FPS -o - | 
      ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i pipe:0 -c:v copy -c:a aac -strict experimental -f flv "$STREAM_HOST/$STREAM_NAME"
fi