#!/usr/bin/env bash
set -euo pipefail

dir=$1

trap 'echo; echo "Interrupted."; exit 130' INT

if [ ! -d "$dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

echo "Converting mp4 files in $dir..."
mkdir -p "$dir"/mov

shopt -s nullglob
for entry in "$dir"/*.mp4
do
    echo "Converting $entry..."
    file="${entry##*/}"
    file_without_extension=${file%.mp4}
    ffmpeg -i "$entry" -hide_banner -loglevel error -c:v prores_ks -profile:v 3 -qscale:v 9 -vendor ap10 -pix_fmt yuv422p10le -acodec pcm_s16le "$dir"/mov/"$file_without_extension".mov
done

echo "Done."
