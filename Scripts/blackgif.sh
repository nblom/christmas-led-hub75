#!/bin/bash

# Convert all MP4 files in Masters/*/*.mp4 to GIFs in Unfinished/ if they don't already exist in Unfinished/ or Finished/
# Uses ffmpeg to perform the conversion and git to track the new files
# Call from base directory, ie ./Scripts/mp42gif.sh

for giffile in Converted/*.gif; do
    if [ ! -f "Unfinished/$giffile" ]; then
        #ffmpeg -i "$giffile" -y -vf "eq=contrast=1.2:brightness=-0.02" "Unfinished/$(basename $giffile)"
        #ffmpeg -i "$giffile" -y -vf "lut='if(lt(val,30),0,val)'" "Unfinished/$(basename $giffile)"
        #ffmpeg -i "$giffile" -y -vf "curves=all='0/0 0.05/0 1/1'" "Unfinished/$(basename $giffile)"
        ffmpeg -i "$giffile" -y -vf "lut='if(lt(val,30),0,val)',curves=all='0/0 0.05/0 1/1'" "Unfinished/$(basename $giffile)"
        #git add "Unfinished/$(basename $newname)"
        #git commit "Unfinished/$(basename $newname)" -m "Add GIF for $(basename "$mp4file")"
    fi
done
