#!/bin/bash

# Configures the timezone
echo "Setting timezone to ${TZ}..."
ln --symbolic --no-dereference --force /usr/share/zoneinfo/${TZ} /etc/localtime
echo ${TZ} > /etc/timezone
