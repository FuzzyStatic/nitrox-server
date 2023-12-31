#!/bin/bash

# Check if the game files are available
while true
do
	echo "Looking for Subnautica's game files..."
	if [ -d "/subnautica/Subnautica_Data" ]
	then
		echo "Subnautica's game files were found at /subnautica"
		break
	else
		echo "Subnautica's game files could not be found, please make sure to mount your Subnautica game directory at /subnautica inside the container"
		echo "Waiting 10 seconds before attempting again..."
		sleep 10
	fi
done

# Start the server executable
echo "Starting the Nitrox server..."
cd /config
mono ./NitroxServer-Subnautica.exe
