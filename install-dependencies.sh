#!/bin/bash

# Install dependencies
echo "Installing dependencies..."
apt-get -y update
apt-get -y install \
	curl \
	mono-complete \
	unzip \
	wget
