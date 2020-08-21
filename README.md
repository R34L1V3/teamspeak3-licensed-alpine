# Teamspeak3 (Alpine Linux) Docker Image [![Docker Automated Build](https://img.shields.io/docker/automated/rodaine/teamspeak3-alpine.svg)](https://hub.docker.com/r/rodaine/teamspeak3-alpine/)

_A Teamspeak 3 Server Licensed built on Alpine Linux (using glibc)_

* Teamspeak3 v3.0.13.5 (8 Nov 2016)
* Lightweight image (<25MB)
* SQLite only
* Easy, optional voluming of logs, db, and query_ip_*list.txt files
* Pass any TS3 startup flags with `docker run`

### Example Run on Windows

```sh
docker run -d --name teamspeak --restart=always -p 9987:9987/udp -p 10011:10011 -v D:\teamspeak\deploy\data:/data r34l1v3/rodaine-teamspeak3-licensed-alpine
```

The other port (30033 for FileManager) can be exposed
individually as well in this manner, or all ports can be exposed with `-P`, 
however the host ports will be random.

### Example Run on Linux

```sh
docker run -d --name teamspeak --restart=always -p 9987:9987/udp -p 10011:10011 -v /opt/teamspeak/deploy/data:/data r34l1v3/rodaine-teamspeak3-licensed-alpine
```