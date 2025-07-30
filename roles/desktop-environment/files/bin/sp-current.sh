#!/bin/bash

ARTIST=$(/home/toothless/bin/sp.sh current | sed -n 's/^Artist *\(.*\)$/\1/p')
TITLE=$(/home/toothless/bin/sp.sh current | sed -n 's/^Title\s*\(.*\)$/\1/p')
echo "$ARTIST: $TITLE"
