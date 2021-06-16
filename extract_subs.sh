#!/bin/bash

# extract subtitles from video

# e.g.: ./extract_subs.sh VIDEO.mp4 SUBS.srt
ffmpeg -i $1 -map 0:s $2
