#!/bin/bash

# trim a video. audio & video quality preserved. trim only precise to the closest keyframe.

# e.g.: ./trim_video.sh HH:MM:SS.SSS INPUT.mp4 HH:MM:SS.SSS OUTPUT.mp4 
ffmpeg -ss "$1" -i "$2" -c copy -to "$3" -avoid_negative_ts make_zero "$4"
