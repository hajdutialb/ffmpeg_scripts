#!/bin/bash

# e.g.: ./extract_audio VIDEO.mp4 AUDIO.m4a

ffmpeg -i "$1" -vn -acodec copy "$2"
