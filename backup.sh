#!/bin/bash

POSITIONAL=()

while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    -i|--input)
      INPUT="$2"
      shift
      shift
      ;;
    -o|--output)
      OUTPUT="$2"
      shift
      shift
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

set -- "${POSITIONAL[@]}"

rsync --update -rzv --copy-links --exclude raw --exclude Unidentified $INPUT $OUTPUT
