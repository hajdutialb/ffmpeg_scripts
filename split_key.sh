#!/bin/bash

# split video in every keyframe (keyframes are parts where you can cut a video precisely without re-encoding)

# e.g. ./split_key INPUT.mp4 OUTPUT_DIRECTORY/
ffmpeg -i "$1" -acodec copy -f segment -vcodec copy -reset_timestamps 1 -map 0 "$2/OUTPUT%d.mp4"
