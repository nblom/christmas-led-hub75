This project uses

Raspberry pi 4
SD card with Raspberry OS 64 bit, debian based, standard using Raspberry Pi Imager

3D printed

Software
ffmpeg - optional, used to convert MP4 to gif.

Method
Using ChatGPT to generate 8 bit pixel art of santa.
Using Google Gemini to generate video based on 8 bit pixel art from ChatGPT.
At the moment of creation Gemini (2.5) is not good at creating pixel art for LED matrises and ChatGPT (Sora 1) is not good at creating videos.
Or at least, i cannot get a working prompt to do so.

Folder structure
Masters - contains mp4 from Gemini AI, not included in this git repo.
Unfinished - converted mp4 to gif using ffmepg, Scripts/mp42gif.sh
Finished - gifs that have gone through quality control and are approved for viewing.