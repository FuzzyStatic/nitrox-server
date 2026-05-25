#!/bin/sh

# Remove existing user
echo "Removing existing user..."
userdel nitrox >/dev/null 2>&1 || true # Actually makes the errors quiet
groupdel nitrox >/dev/null 2>&1 || true

# Create the user group
echo "Creating Nitrox user group with ID ${PGID:-1000}..."
groupadd --gid "${PGID:-1000}" nitrox

# Create the user
echo "Creating Nitrox user account with ID ${PUID:-1000}..."
useradd --gid "${PGID:-1000}" --uid "${PUID:-1000}" --home-dir /config nitrox

# Change the active user
echo "Switching to Nitrox user..."
su - nitrox
