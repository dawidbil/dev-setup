#!/usr/bin/env bash
# Prints: <icon> Artist - Title [mm:ss/mm:ss] when Playing
# When Paused: prints "<paused_icon> Paused"
# Truncates to $PLAYERCTL_MAX (default 70). Ignores mpv (wallpaper).

MAX="${PLAYERCTL_MAX:-55}"

fmt_time() {
  local total=${1%.*}; (( total<0 )) && total=0
  local h=$(( total/3600 )); local m=$(( (total%3600)/60 )); local s=$(( total%60 ))
  (( h>0 )) && printf "%d:%02d:%02d" "$h" "$m" "$s" || printf "%d:%02d" "$m" "$s"
}

status=$(playerctl --ignore-player=mpv status 2>/dev/null || true)

if [[ "$status" == "Playing" ]]; then
  artist=$(playerctl --ignore-player=mpv metadata artist 2>/dev/null)
  title=$(playerctl --ignore-player=mpv metadata title 2>/dev/null)
  [[ -z "$artist$title" ]] && { echo ""; exit 0; }

  pos=$(playerctl --ignore-player=mpv position 2>/dev/null || echo "")
  len_us=$(playerctl --ignore-player=mpv metadata mpris:length 2>/dev/null || echo "")

  # mpris:length typically μs for Spotify/most; fallback smartly
  len=""
  if [[ "$len_us" =~ ^[0-9]+$ ]]; then
    if (( len_us >= 1000000000 )); then
      len=$(( len_us/1000000000 ))
    elif (( len_us >= 10000000 )); then
      len=$(( len_us/1000000 ))
    else
      len=$len_us
    fi
  fi

  icon=""
  pos_s=""; [[ -n "$pos" ]] && pos_s=$(fmt_time "$pos")
  len_s=""; [[ -n "$len" ]] && len_s=$(fmt_time "$len")
  timer=""; [[ -n "$pos_s$len_s" ]] && timer=" ${pos_s}${len_s:+/$len_s}"

  text="$artist - $title$timer"
  if (( ${#text} > MAX )); then
    echo "$icon  ${text:0:MAX-1}…"
  else
    echo "$icon  $text"
  fi

elif [[ "$status" == "Paused" ]]; then
  echo " Paused"
else
  echo " idle"
fi
