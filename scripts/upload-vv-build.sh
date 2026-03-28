#!/usr/bin/env bash
set -euo pipefail

DETACH=0
if [[ "${1:-}" == "-d" || "${1:-}" == "--detach" ]]; then
  DETACH=1
  shift
fi

if (( DETACH )); then
  nohup "$0" > /tmp/vv-upload.log 2>&1 &
  disown || true
  echo "vvu running in detached mode. Log: /tmp/vv-upload.log"
  exit 0
fi

notify-send "Vibrant Venture" "Compressing build..."

DIR="$HOME/git/Vibrant-Venture/Builds/Vibrant Venture Windows 64-bit"
ARCH="vv.7z"

rm -f "$DIR"/*.zip "$DIR"/*.7z 2>/dev/null || true

( cd "$DIR" && 7z a -t7z -mx=9 -mmt=on "$ARCH" . >/dev/null )

notify-send "Vibrant Venture" "Uploading build..."

url="$(curl -fsS \
  -F reqtype=fileupload \
  -F time=72h \
  -F "fileToUpload=@$DIR/$ARCH" \
  https://litterbox.catbox.moe/resources/internals/api.php
)"

echo "$url"
printf '%s' "$url" | wl-copy
notify-send "Vibrant Venture" "Upload done — link copied"

rm -f "$DIR/$ARCH"

