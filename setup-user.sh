#!/bin/bash

# Remove existing user
echo "Removing existing user..."
userdel nitrox || true
groupdel nitrox || true

# Create the user group
echo "Creating Nitrox user group with ID ${PGID}..."
groupadd --gid ${PGID} nitrox

# Create the user
echo "Creating Nitrox user account with ID ${PUID}..."
useradd --gid ${PGID} --uid ${PUID} --home-dir /config nitrox

# Change the active user
echo "Switching to Nitrox user..."
su - nitrox
