#!/bin/bash

# Download the latest release
echo "Downloading latest Nitrox release..."
mkdir --parents /software/packages
cd /software/packages
curl --silent https://nitrox.rux.gg/download/start 
    | grep --only-matching --max-count 1 "https://github.com/SubnauticaNitrox/Nitrox/releases/download/[^ ]*\.zip" 
    | wget --output-document ./nitrox.zip --quiet --input-file -

# Unzip the package
echo "Unzipping Nitrox..."
mkdir --parents /software/nitrox
cd /software/nitrox
unzip -u /software/packages/nitrox.zip -d ./

# Fix the permissions
echo "Fixing Nitrox permissions..."
chmod +x ./*.exe

# Fix bug due to Linux file name case sensitivity
echo "Fixing Nitrox case sensitive filenames..."
ln --symbolic --force /software/subnautica/Subnautica_Data/Managed/LitJson.dll ./LitJSON.dll

# Set the path to Subnautica
echo "/software/subnautica" > ./path.txt
