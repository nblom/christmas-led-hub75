#!/bin/bash

# Convert all MP4 files in Masters/*/*.mp4 to GIFs in Converted/ if they don't already exist in Converted/ or Finished/
# Uses ffmpeg to perform the conversion and git to track the new files
# Call from base directory, ie ./Scripts/mp42gif.sh

for mp4file in Masters/*/*.mp4; do
    giffile=$(basename "${mp4file%.mp4}.gif")
    if [ ! -f "Converted/$giffile" ]; then
        #ffmpeg -i input.mp4 -vf "curves=all='0/0 0.1/0 0.9/1 1/1'" -c:a copy output.mp4
        ffmpeg -i "$mp4file" -y -vf "fps=25,curves=all='0/0 0.1/0 0.9/1 1/1',split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse,scale=128:64:flags=lanczos" -loop 0 "Converted/$giffile"
        git add "Converted/$giffile"
        git commit "Converted/$giffile" -m "Add converted GIF for $(basename "$mp4file")"
    fi
done
