#!/bin/bash

# slow down video from PAL to NTSC speed without changing audio pitch. Audio quality is preserved (lossless flac), video quality is not (lossy h264)

# e.g. ./pal_to_ntsc.sh INPUT.mp4 OUTPUT.mkv
ffmpeg -i "$1" -filter:v "setpts=25025/24000*PTS" -map 0:v -map 0:a -vcodec h264 -preset ultrafast -acodec flac -filter:a atempo=24000/25025 -r 24000/1001 "$2"
