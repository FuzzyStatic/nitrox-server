#!/bin/bash

# Download the latest release
echo "Downloading latest Nitrox release..."
mkdir --parents /config/packages
cd /config/packages
curl --silent https://nitrox.rux.gg/download/start \
    | grep --only-matching --max-count 1 "https://github.com/SubnauticaNitrox/Nitrox/releases/download/[^ ]*\.zip" \
    | wget --output-document ./nitrox.zip --quiet --input-file -

# Unzip the package
echo "Unzipping Nitrox..."
cd /config
unzip -u /config/packages/nitrox.zip -d ./

# Fix the permissions
echo "Fixing Nitrox permissions..."
chmod +x ./*.exe

# Fix bug due to Linux file name case sensitivity
echo "Fixing Nitrox case sensitive filenames..."
ln --symbolic --force /subnautica/Subnautica_Data/Managed/LitJson.dll ./LitJSON.dll

# Set the path to Subnautica
echo "/subnautica" > ./path.txt
