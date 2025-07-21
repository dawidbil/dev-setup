#!/usr/bin/env bash

WALLPAPERS_DIR="$HOME/Wallpapers"
STATEFILE="$HOME/.cache/i3wallpaper_file"

SELECTED=$(find "$WALLPAPERS_DIR" -type f | sort | ~/.fzf/bin/fzf --prompt="Wallpapers> ")

if [[ -n "$SELECTED" ]]; then
  echo "$SELECTED" > "$STATEFILE"
  feh --bg-fill "$SELECTED"
fi

