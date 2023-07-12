# [FuzzyStatic/nitrox-server](https://github.com/FuzzyStatic/nitrox-server)

[Nitrox](https://github.com/SubnauticaNitrox/Nitrox) is an open-source, multiplayer modification for the game [Subnautica](https://unknownworlds.com/subnautica/). Visit the official Nitrox website [here](https://nitrox.rux.gg/download). Currently, this container pulls the latest Nitrox Server upon deployment.

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose

To run the image using docker-compose, adjust this docker-compose file to your needs:

```docker
version: "1.0"
services:
  nitrox:
    image: docker.io/fuzzystatic/nitrox-server:latest
    container_name: nitrox-server
    volumes:
      - "/path/to/nitrox:/config"
      - "/path/to/subnautica:/subnautica"
    environment:
      - "PUID=1000"
      - "PGID=1000"
      - "TZ=Etc/UTC"
      - "SUBNAUTICA_INSTALLATION_PATH=/subnautica"
    ports:
      - "11000:11000/udp"
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
  -p 11000:11000/udp \
  -v /path/to/nitrox:/config \
  -v /path/to/subnautica:/subnautica \
  --restart unless-stopped \
  docker.io/fuzzystatic/nitrox-server:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 11000/udp` | server port - port forwarding may be required to host on the internet. |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Etc/UTC` | specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List). |
| `-e SUBNAUTICA_INSTALLATION_PATH=/subnautica` | Subnautica game data. |
| `-v /config` | Nitrox server data storage location. |
| `-v /subnautica` | Subnautica game data goes here. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```bash
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```
