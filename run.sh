#!/bin/bash

outputDir="output"

[ -e "${outputDir}" ] || mkdir "${outputDir}"


for filePath in input/JetBrainsMonoNerdFont*; do
  fileName=$(basename "${filePath}" | sed s/JetBrainsMono/JetBrainsMonoZero/)
  echo "- ${fileName}"
  pyftfeatfreeze -f 'zero' -R 'JetBrainsMono/JetBrainsMonoZero' "${filePath}" "${outputDir}/${fileName}"
done
