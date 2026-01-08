#!/bin/bash

# Kill ffmpeg process gracefully
if [ -f /tmp/ffmpeg_screenrecord.pid ]; then
    PID=$(cat /tmp/ffmpeg_screenrecord.pid)
    kill -2 $PID
    rm /tmp/ffmpeg_screenrecord.pid
    notify-send -t 500 "Screen Recording" "Recording stopped"
else
    notify-send -t 500 "Screen Recording" "No recording process found."
fi

