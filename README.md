# Cron with docker

With this container you can use cron service inside docker.

**Installed executables:**

- bash
- find
- wget
- curl

## Cronfile example

Create a cronfile like this somewhere and define this file as a volume in docker command.

```
0 0 * * 1,4 /usr/bin/wget --http-user=test --http-password=test -q -O /dev/null "http://example.com/script.php"
0 2 * * * /usr/bin/find /volume/path* -mtime +30 delete
```

*This example runs the `http://example.com/script.php` script every Monday and Thrursday at midnight (using basic http authentication) and clears files every day at 2 AM in the `/volume/path` directory which are older than 30 days.*

*Mount volumes like `/volume/path` from host system if it's needed.*

## Usage

**Docker command:**

```bash
docker run --name=cron \
  --restart=always \
  -v <path_to_cronfile>:/cronfile \
  -v /etc/localtime:/etc/localtime:ro \
  -d humpedli/docker-cron
```

---
**Docker compose:**

```bash
version: '3'
services:
  cron:
    container_name: "cron"
    image: "humpedli/docker-cron"
    volumes:
      - "<path_to_cronfile>:/cronfile"
      - "/etc/localtime:/etc/localtime:ro"
    restart: "always"
```
