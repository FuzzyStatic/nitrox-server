#!/bin/bash

# Download Nitrox
echo "Downloading Nitrox release..."
mkdir --parents /config/packages
cd /config/packages

shopt -s nocasematch;
if [[ "${NITROX_VERSION:-"latest"}" =~ "latest" ]]
then
    NITROX_URL=https://api.github.com/repos/"${CUSTOM_NITROX_REPOSITORY:-"SubnauticaNitrox/Nitrox"}"/releases/latest
else
    NITROX_URL=https://api.github.com/repos/"${CUSTOM_NITROX_REPOSITORY:-"SubnauticaNitrox/Nitrox"}"/releases/tags/"${NITROX_VERSION:-"latest"}"
fi

curl --silent "$NITROX_URL" \
    | grep -wo "https.*linux_x64.zip" \
    | wget --output-document ./nitrox.zip --quiet --input-file -

# Unzip the package
echo "Unzipping Nitrox..."
cd /config
unzip -u /config/packages/nitrox.zip -d ./

# Fix the permissions
echo "Fixing Nitrox permissions..."
chmod +x Nitrox.Launcher Nitrox.Server.Subnautica # *.exe did nothing because this is linux

# Fix bug due to Linux file name case sensitivity
echo "Fixing Nitrox case sensitive filenames..."
ln --symbolic --force "${SUBNAUTICA_INSTALLATION_PATH:-"/subnautica"}"/Subnautica_Data/Managed/LitJson.dll ./LitJSON.dll

# Set the path to Subnautica
echo "${SUBNAUTICA_INSTALLATION_PATH:-"/subnautica"}" > ./path.txt
