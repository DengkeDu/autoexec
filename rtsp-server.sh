#!/bin/bash
raspivid -n -t 0 -hf -fps 20 -w 300 -h 300 -o - | gst-launch-1.0 fdsrc ! h264parse ! gdppay ! tcpserversink host=127.0.0.1 port=5001 &
test-launch "( tcpclientsrc host=127.0.0.1 port=5001 ! gdpdepay ! rtph264pay pt=96 name=pay0 )"
