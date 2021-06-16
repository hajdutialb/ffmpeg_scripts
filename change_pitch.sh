#!/bin/bash

# change audio pitch. audio quality not preserved (lossy), video kept intact (not re-encoded).

# e.g.: ./change_pitch.sh INPUT.mp4 SPEED_COMPENSATION OUTPUT.mp4
# e.g. a speed compensation of 2 will undo the effects of a 2x pitched audio file, so it'll make the pitch lower

result=$(ffprobe "$1" 2>&1 | grep " Hz")
result_arr=($result)
for i in "${!result_arr[@]}"; do if [[ "${result_arr[$i]}" == "Hz," ]]; then hz="${result_arr[$(($i-1))]}"; fi; done

ffmpeg -i "$1" -map 0:a -af asetrate=$hz/"$2",aresample=$hz,atempo="$2" "$3"
