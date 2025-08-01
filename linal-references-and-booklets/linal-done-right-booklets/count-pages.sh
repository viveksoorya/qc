#!/bin/bash

# Number of sections per chapter in ascending order of chapters
sections_per_chapter=(3 3 6 5 5 3 6 4 4)

# Check if chapter argument is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <chapter_number (1-9)>"
  exit 1
fi

chapter=$1

# Validate chapter number
if ! [[ "$chapter" =~ ^[1-9]$ ]]; then
  echo "Error: Chapter number must be an integer between 1 and 9."
  exit 1
fi

max_section=${sections_per_chapter[$((chapter-1))]}

for section in $(seq 1 $max_section); do
  filename="section${section}-chapter${chapter}.pdf"
  if [[ -f "$filename" ]]; then
    echo "Processing $filename"
    pdftk "$filename" dump_data | grep NumberOfPages
  else
    echo "File $filename does not exist, skipping."
  fi
done

