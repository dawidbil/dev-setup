#!/usr/bin/env bash

WALLDIR="$HOME/Wallpapers"      # Set your wallpapers directory
STATEFILE="$HOME/.cache/i3wallpaper_file"
MODE="${1:-next}"               # 'next', 'prev', or 'set'

# Get absolute file paths using find (all files, sorted)
readarray -t IMGS < <(find "$WALLDIR" -type f | sort)

NUM=${#IMGS[@]}
[[ $NUM -eq 0 ]] && exit 1

if [[ -f "$STATEFILE" ]]; then
    CURFILE=$(cat "$STATEFILE")
else
    CURFILE=""
fi

CUR=0
if [[ "$CURFILE" != "" ]]; then
    for i in "${!IMGS[@]}"; do
        if [[ "${IMGS[$i]}" == "$CURFILE" ]]; then
            CUR=$i
            break
        fi
    done
fi

if [[ "$MODE" == "set" ]]; then
    # Use the current
    :
elif [[ "$MODE" == "next" ]]; then
    CUR=$(( (CUR+1) % NUM ))
elif [[ "$MODE" == "prev" ]]; then
    CUR=$(( (CUR-1+NUM) % NUM ))
fi

CURFILE="${IMGS[$CUR]}"
echo "$CURFILE" > "$STATEFILE"
feh --bg-fill "$CURFILE"

