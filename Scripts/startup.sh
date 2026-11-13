#!/usr/bin/bash

# Check if current month is November (month 11)
MONTH=$(date +%m)

if [ "$MONTH" = "11" ]; then
    # Select a random file from November folder
    FILE=$(ls ../November/* 2>/dev/null | shuf -n 1)
    if [ -z "$FILE" ]; then
        # Fallback to Converted if November folder is empty
        FILE="Converted/*"
    fi
else
    # Use Converted folder for other months
    FILE="Converted/*"
fi

../rpi-rgb-led-matrix/utils/led-image-viewer \
--led-limit-refresh=200 \
--led-cols 64 \
--led-rows 32 \
--led-slowdown-gpio=4 \
--led-chain=2 \
--led-parallel=2 \
--led-brightness=75 \
-D4 \
-V10 \
-f \
-s \
$FILE
