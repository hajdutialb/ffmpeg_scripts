#!/bin/bash

# concatenate video files. input must be inside a text file list like this:
# file "part1.ts"
# file "part2.ts"

# e.g.: ./concat.sh LIST.txt OUTPUT.mp4

ffmpeg -f concat -safe 0 -i "$1" -vcodec copy -acodec copy -map_metadata -1 -movflags +faststart "$2"
