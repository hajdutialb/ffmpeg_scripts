#!/bin/bash

# change audio pitch from NTSC pitch to PAL pitch. Audio quality preserved (lossless flac), video kept unchanged (not re-encoded)

# e.g. ./pal_pitch.sh INPUT.mp4 OUTPUT.mkv

result=$(ffprobe "$1" 2>&1 | grep " Hz")
result_arr=($result)
for i in "${!result_arr[@]}"; do if [[ "${result_arr[$i]}" == "Hz," ]]; then hz="${result_arr[$(($i-1))]}"; fi; done

ffmpeg -i "$1"  -vcodec copy -acodec flac -af asetrate="$hz/(24000/25025)",aresample=$hz,atempo="24000/25025" "$2"
