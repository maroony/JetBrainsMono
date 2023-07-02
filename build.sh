#!/bin/bash

echo "Started"

# shellcheck source="build.cfg"
source "build.cfg"

rm -rf "${inputDir}"
rm -rf "${outputDir}"

mkdir "${inputDir}"
mkdir "${outputDir}"


echo "Step 1/2: Downloading font"

cd "${inputDir}" || exit 1

zipFile="JetBrainsMono.zip"

wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/${zipFile}"
unzip "${zipFile}"

# remove non litagures files
rm ./*NL*

cd - || exit 1

echo "Step 2/2: Patching font"

for filePath in input/JetBrainsMonoNerdFont*; do
  fileName=$(basename "${filePath}" | sed s/JetBrainsMono/JetBrainsMonoZero/)
  echo "- ${fileName}"
  pyftfeatfreeze -f "${features}" -R 'JetBrainsMono/JetBrainsMonoZero' "${filePath}" "${outputDir}/${fileName}"
done

echo "Finished"
