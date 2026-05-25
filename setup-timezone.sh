#!/bin/sh

# Configures the timezone
echo "Setting timezone to ${TZL:-"Etc/UTC"}..."
ln --symbolic --no-dereference --force /usr/share/zoneinfo/"${TZ:-"Etc/UTC"}" /etc/localtime
echo "${TZ:-"Etc/UTC"}" > /etc/timezone
