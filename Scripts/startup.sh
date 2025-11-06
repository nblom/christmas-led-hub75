#!/usr/bin/bash

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
Converted/*
