# [FuzzyStatic/nitrox-server](https://github.com/FuzzyStatic/nitrox-server)

[Nitrox](https://github.com/SubnauticaNitrox/Nitrox) is an open-source, multiplayer modification for the game [Subnautica](https://unknownworlds.com/subnautica/). Visit the official Nitrox website [here](https://nitrox.rux.gg/download). Currently, by default this container pulls the latest Nitrox Server upon deployment.

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose

To run the image using docker-compose, adjust this docker-compose file to your needs:

```yaml
version: "1.0"
services:
  nitrox:
    image: fuzzystatic/nitrox-server:latest
    container_name: nitrox-server
    volumes:
      - "/path/to/nitrox:/config" # Stores your server data, such as the configuration and world data
      - "/path/to/subnautica:/subnautica" # Stores Subnautica's game files - you will need to copy your own game directory here by moving the contents of your Subnautica installation directory to this volume
    environment:
      - "PUID=1000" # The ID of the group to run Nitrox as (default=1000)
      - "PGID=1000" # The ID of the user to run Nitrox as (default=1000)
      - "TZ=Etc/UTC" # The timezone to run Nitrox with (default=Etc/UTC)
      - "SUBNAUTICA_INSTALLATION_PATH=/subnautica" # The path on the container where 'Subnautica_Data' directory is (default=/subnautica)
      - "SUBNAUTICA_SAVE=My World" # Set this to your desired save name (default=My World)
      - "NITROX_VERSION=latest" # Set this to change the Nitrox version used, e.g. NITROX_VERSION=1.8.1.0 (default=latest)
      - "CUSTOM_NITROX_REPOSITORY=SubnauticaNitrox/Nitrox" # Set this to the fork you want to use (default=SubnauticaNitrox/Nitrox)
    ports:
      - "11000:11000/udp" # Nitrox
    restart: "unless-stopped"
```

### docker-cli

```shell
docker run -d \
  --name=nitrox-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e SUBNAUTICA_INSTALLATION_PATH=/subnautica \
  -e NITROX_VERSION=latest \
  -p 11000:11000/udp \
  -v /path/to/nitrox:/config \
  -v /path/to/subnautica:/subnautica \
  --restart unless-stopped \
  docker.io/fuzzystatic/nitrox-server:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

|                   Parameter                   | Function                                                                                                       |
|:---------------------------------------------:|----------------------------------------------------------------------------------------------------------------|
|                `-p 11000/udp`                 | server port - port forwarding may be required to host on the internet.                                         |
|                `-e PUID=1000`                 | for UserID - see below for explanation                                                                         |
|                `-e PGID=1000`                 | for GroupID - see below for explanation                                                                        |
|                `-e TZ=Etc/UTC`                | specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List). |
| `-e SUBNAUTICA_INSTALLATION_PATH=/subnautica` | Subnautica game data (on the container).                                                                       |
|           `-e NITROX_VERSION=latest`          | Nitrox server version.                                                                                         |
|                 `-v /config`                  | Nitrox server data storage location.                                                                           |
|               `-v /subnautica`                | Subnautica game data goes here.                                                                                |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```bash
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```
