# Nitrox Server Docker

A docker image that runs the Nitrox server software for the game Subnautica.

Visit the official Nitrox website [here](https://nitrox.rux.gg/download).
You can find the original repository for this project [here](https://github.com/FuzzyStatic/nitrox-server).

## Disclaimer

This project is not affiliated with either the Nitrox or the Subnautica developers.

## Usage

To run this image, you can either simply use docker or use docker-compose.

### docker-compose

To run the image using docker-compose, adjust this docker-compose file to your needs:

```docker
version: "1.0"
services:
  nitrox:
    image: docker.io/fuzzystatic/nitrox-server:latest
    container_name: nitrox-server
    volumes:
      - "/path/to/nitrox:/config" # Stores your server data, such as the configuration and world data
      - "/path/to/subnautica:/subnautica" # Stores Subnautica's game files - you will need to copy your own game directory here by moving the contents of your Subnautica installation directory to this volume
    environment:
      - "PUID=1000" # The ID of the group to run Nitrox as (default=1000)
      - "PGID=1000" # The ID of the user to run Nitrox as (default=1000)
      - "TZ=Etc/UTC" # The timezone to run Nitrox with (default=Etc/UTC)
      - "SUBNAUTICA_INSTALLATION_PATH=/subnautica" # The timezone to run Nitrox with (default=/subnautica)
    ports:
      - "11000:11000/udp" # Nitrox
    restart: "unless-stopped"
```

### docker-cli

```shell
docker run -d \
  --name=jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e SUBNAUTICA_INSTALLATION_PATH=/subnautica \
  -p 11000:11000/udp \
  -v /path/to/nitrox:/config \
  -v /path/to/subnautica:/subnautica \
  -v /path/to/movies:/data/movies \
  --restart unless-stopped \
  docker.io/fuzzystatic/nitrox-server:latest
```
### Server Configuration

You can find your server files including the configuration files in the `nitrox-data` volume.
Docker volumes are usually stored in `/var/docker/volumes`.
