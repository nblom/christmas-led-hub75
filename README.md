# Christmas led dot matrix panel HUB75


## Hardware Requirements

- **Raspberry Pi 4**
- **SD card** with Raspberry OS 64-bit (Debian-based, standard using Raspberry Pi Imager)
- **Panels:**
	- 4x P5 Indoor Full Color LED Display Panel (64x32 pixels, 320mm x 160mm, 1/16 scan, SMD 3-in-1, 5mm 3528 RGB)
		- [Panel link 1](https://www.aliexpress.com/item/32817970711.html)
		- [Panel link 2](https://www.aliexpress.com/item/32965250590.html)
- **HUB75 interface**
- [RGB LED Matrix Panel Drive Board](https://www.electrodragon.com/product/rgb-matrix-panel-drive-board-raspberry-pi/)
- [rpi-rgb-led-matrix utils README](https://github.com/hzeller/rpi-rgb-led-matrix/blob/master/utils/README.md)


## Setup Instructions

1. **Install dependencies:**
	- `sudo apt-get install libgraphicsmagick++-dev libwebp-dev -y`
2. **Optimize CPU usage:**
	- Add `isolcpus=3` at the end of `/boot/formware/cmdline.txt` and reboot.
3. **Clone and build rpi-rgb-led-matrix:**
	- `git clone https://github.com/hzeller/rpi-rgb-led-matrix.git`
	- `cd rpi-rgb-led-matrix`
	- `sudo apt-get install -y git build-essential python3-dev python3-pip python3-pillow swig`
	- `sudo apt-get install cython3`
	- `make -j4 build-python`
	- `make install-python`
4. **Build led-image-viewer:**
	- `make led-image-viewer`
5. **Clone this repository:**
	- `git clone https://github.com/nblom/christmas-led-hub75.git`


## 3D Printed Parts

- [Panel bracket model](https://www.printables.com/model/578204-hub75-5mm-pitch-4-panel-bracket#preview.Aqd77)
	- *Note: Fit was far from perfect, some drilling required.*


## Software

- **ffmpeg** (optional): Used to convert MP4 to GIF.


## Method

- Use ChatGPT to generate 8-bit pixel art of Santa.
- Use Google Gemini to generate video based on pixel art from ChatGPT.
- *Note: As of creation, Gemini (2.5) struggles with pixel art for LED matrices, and ChatGPT (Sora 1) is not good at creating 8 bit pixel style videos.*


## Folder Structure

- **Masters:** Contains MP4 files from Gemini AI (not included in this repo)
- **Converted:** Converted MP4 to GIF using ffmpeg (`Scripts/mp42gif.sh`)
- **Scripts:** Contains scripts used in project

## Example

![Santa sleeping GIF](https://raw.githubusercontent.com/nblom/christmas-led-hub75/refs/heads/main/Converted/Santa_sleeping.gif)
