#!/usr/bin/env bash
# Kill old bars
pkill polybar

# Wait until they're gone
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Launch Polybar on each monitor
for m in $(polybar --list-monitors | cut -d: -f1); do
    MONITOR=$m polybar --reload mybar &
done
