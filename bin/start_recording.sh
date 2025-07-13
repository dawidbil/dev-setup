#!/bin/bash

# Output file with timestamp
OUTPUT="$HOME/Videos/screenrecord_$(date +%Y%m%d_%H%M%S).mp4"

# Start ffmpeg in background
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -preset ultrafast -pix_fmt yuv420p -c:a aac -b:a 128k -movflags +faststart "$OUTPUT" &

# Save ffmpeg PID to a file
echo $! > /tmp/ffmpeg_screenrecord.pid

notify-send -t 500 "Screen Recording" "Recording started: $OUTPUT"

