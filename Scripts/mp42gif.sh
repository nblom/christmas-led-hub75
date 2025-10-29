#!/bin/bash

# Convert all MP4 files in Masters/*/*.mp4 to GIFs in Unfinished/ if they don't already exist in Unfinished/ or Finished/
# Uses ffmpeg to perform the conversion and git to track the new files
# Call from base directory, ie ./Scripts/mp42gif.sh

for mp4file in Masters/*/*.mp4; do
    giffile=$(basename "${mp4file%.mp4}.gif")
    if [ ! -f "Unfinished/$giffile" ] && [ ! -f "Finished/$giffile" ]; then
        ffmpeg -i "$mp4file" -y -vf 'fps=25,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse,scale=128:64:flags=lanczos' -loop 0 "Unfinished/$giffile"
        git add "Unfinished/$giffile"
        git commit "Unfinished/$giffile" -m "Add GIF for $(basename "$mp4file")"
    fi
done