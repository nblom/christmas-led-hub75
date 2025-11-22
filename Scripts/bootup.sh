#!/usr/bin/bash

# maybe better with wpa_cli -i wlan0 status

(echo "Connect to: " $(iwgetid -r); echo $(ip --brief -4 address show scope global | awk '{print $3}'); sleep 60) | \
../rpi-rgb-led-matrix/examples-api-use/text-example \
--led-limit-refresh=200 \
--led-cols 64 \
--led-rows 32 \
--led-slowdown-gpio=4 \
--led-chain=2 \
--led-parallel=2 \
--led-brightness=50 \
-f ../rpi-rgb-led-matrix/fonts/6x10.bdf
