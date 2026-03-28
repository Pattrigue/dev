#!/usr/bin/env bash
set -euo pipefail

dir="$HOME/Videos/Footage"

file="$(
  ls -t "$dir"/*.mp4 "$dir"/*.webm "$dir"/*.mkv "$dir"/*.gif 2>/dev/null | head -n 1 || true
)"

if [[ -z "$file" ]]; then
  command -v notify-send >/dev/null 2>&1 && notify-send "Catbox upload" "No recordings found in $dir" || true
  exit 1
fi

command -v notify-send >/dev/null 2>&1 && notify-send "Catbox upload" "Uploading $file..." || true

url="$(
  curl -fsS \
    -F "reqtype=fileupload" \
    -F "fileToUpload=@${file}" \
    "https://catbox.moe/user/api.php"
)"

if command -v wl-copy >/dev/null 2>&1; then
  printf '%s' "$url" | wl-copy
elif command -v xclip >/dev/null 2>&1; then
  printf '%s' "$url" | xclip -selection clipboard
fi

command -v notify-send >/dev/null 2>&1 && notify-send "Uploaded to Catbox" "$url" || true
printf '%s\n' "$url"
