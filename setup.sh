#!/bin/bash

# https://github.com/twardoch/fonttools-opentype-feature-freezer
brew install pipx
pipx install opentype-feature-freezer

# latest release from JetBrainsMono

mkdir input
cd input

repo="ryanoasis/nerd-fonts"
curl -s "https://api.github.com/repos/${repo}/releases/latest" \
| grep "\"browser_download_url\":.*/JetBrainsMono.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

unzip JetBrainsMono.zip

# remove non litagures files
rm *NL*

cd -
