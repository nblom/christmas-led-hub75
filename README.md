# Christmas led dot matrix panel HUB75

## This project uses

Raspberry pi 4
SD card with Raspberry OS 64 bit, debian based, standard using Raspberry Pi Imager
Panels: 4x P5 Indoor Full Color Led Display Panel 64 * 32 Pixel 320mm * 160mm Size 1/16 Scan SMD 3 in 1 5mm 3528 RGB Board Led Module
https://www.aliexpress.com/item/32817970711.html

https://github.com/hzeller/rpi-rgb-led-matrix/blob/master/utils/README.md

## Howto
apt-get install libgraphicsmagick++-dev libwebp-dev -y
make led-image-viewer

## 3D printed
https://www.printables.com/model/578204-hub75-5mm-pitch-4-panel-bracket#preview.Aqd77
Fit was not good so a drill was needed.

## Software
ffmpeg - optional, used to convert MP4 to gif.

## Method
Using ChatGPT to generate 8 bit pixel art of santa.
Using Google Gemini to generate video based on 8 bit pixel art from ChatGPT.
At the moment of creation Gemini (2.5) is not good at creating pixel art for LED matrises and ChatGPT (Sora 1) is not good at creating videos.
Or at least, i cannot get a working prompt to do so.

## Folder structure
Masters - contains mp4 from Gemini AI, not included in this git repo.
Unfinished - converted mp4 to gif using ffmepg, Scripts/mp42gif.sh
Finished - gifs that have gone through quality control and are approved for viewing.

## Examples

![image](https://raw.githubusercontent.com/nblom/christmas-led-hub75/refs/heads/main/Finished/Santa_sleeping.gif)