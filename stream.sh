#!/bin/sh

gst-launch-1.0 --no-position \
	pulsesrc ! audio/x-raw,format=S16LE,rate=48000,channels=1 ! \
	audioconvert ! opusenc bitrate-type=2 bitrate=65536 ! oggmux ! \
	tee name=t  ! queue ! srtsink uri='srt://[::]:11000/?mode=listener' wait-for-connection=false \
	         t. ! queue ! tcpserversink host=0.0.0.0 port=11000
