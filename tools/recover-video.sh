#!/usr/bin/env bash
# recover-video.sh INPUT_FILE OUTPUT_DIR [NEW_NAME]

set -euo pipefail

if [[ $# -lt 2 || $# -gt 3 ]]; then
echo "Usage: $0 INPUT_FILE OUTPUT_DIR [NEW_NAME]"
exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="$2"
NEW_NAME="${3:-}"

if [[ ! -f "$INPUT_FILE" ]]; then
echo "Error: file not found:"
echo "  $INPUT_FILE"
exit 1
fi

mkdir -p "$OUTPUT_DIR"

if [[ -n "$NEW_NAME" ]]; then
OUTPUT_BASENAME="$NEW_NAME"
else
FILENAME="$(basename "$INPUT_FILE")"
OUTPUT_BASENAME="${FILENAME%.*}"
fi

OUTPUT_FILE="${OUTPUT_DIR}/${OUTPUT_BASENAME}.mp4"

echo "----------------------------------------"
echo "Input : $INPUT_FILE"
echo "Output: $OUTPUT_FILE"
echo "----------------------------------------"

ffmpeg -hide_banner -fflags +discardcorrupt+genpts -err_detect ignore_err -i "$INPUT_FILE" -map 0:v? -map 0:a? -c:v libx264 -preset medium -crf 16 -c:a aac -b:a 192k -movflags +faststart -y "$OUTPUT_FILE"

echo
echo "Done:"
echo "  $OUTPUT_FILE"

