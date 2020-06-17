#!/bin/bash

POSITIONAL=()

while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    -s|--size)
      SIZE="$2"
      shift
      shift
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    -o)
      OUTPUT="$2"
      shift
      shift
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

set -- "${POSITIONAL[@]}"

array=()
while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
done < <(find "$1" -size "+${SIZE}" -print0)

for i in "${!array[@]}"
do
  file="${array[$i]}"
  echo "Transcoding ($((i + 1))/${#array[@]}) $(basename "$file")..."
  if [ "$DRY_RUN" = true ]; then
    echo "Skipping transcoding step... (dry-run)"
  else
    HandBrakeCLI --preset-import-file "./H.264 MKV 1080p30.json" \
      -Z "H.264 MKV 1080p30 Custom" \
      --all-subtitles --all-audio \
      -i "$file" \
      -o "$OUTPUT$(basename "$file")"
  fi
done
