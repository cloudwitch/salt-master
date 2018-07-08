# Salt-Master Docker Container

Salt-Master by Saltstack.

Base image is ubuntu:latest.  The salt repos are pulled directly from repos.saltstack.com to assure the latest version.  These are the python3 repos.  Included in the git project is a docker-compose.yml that works with Docker Swarm.

This container has all the salt-master goodies installed:
* salt-master
* salt-api
* salt-cloud
* salt-common
* salt-pepper
* salt-ssh
* salt-syndic

Container image builds weekly from my personal Gitlab Instance.  It is synced to my [GitHub Project](https://github.com/pheonix991/salt-master).

Your mount points are:
* /etc/salt
* /srv/salt
* /srv/pillar

docker run:
```bash
docker run -it -v /etc/salt:/etc/salt -v /srv/salt:/srv/salt -v /srv/pillar:/srv/pillar -v /etc/timezone:/etc/timezone:ro -p 4505:4505 -p 4506:4506 pheonix991/salt-master:latest
```