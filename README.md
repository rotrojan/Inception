# Inception
This devOps projects aims to build a simple infrastructure composed of three docker containers: a Nginx server, a MariaDB database and a Wordpress site with php-fpm.
Those containers are built upon an Alpine Linux docker-image and orchestrated by a docker-compose file. The wordpress site and the database must be both on a their own persistent docker-volume, a custom docker-network must be set, the connection must be done via https and specific ports must be used.

<p align="center">
  <img height="600", src="https://user-images.githubusercontent.com/52586053/205698932-fa852317-e849-4981-baad-3de9d59039c1.png" />
</p>

### Usage
```
make
```
or
```
make build
```
Build the infratructure.
<br /> <br />

```
make check
```
Display the running containers.
<br /> <br />

```
make logs
```
Display the logs.
<br /> <br />

```
make stop
```
Stop the containers of the infrastructure.
<br /> <br />
```
make down
```
Stop and erase the containers and the volumes of the infrastructure.
<br /> <br />
```
make clean
```
Delete the content of the volumes without removing them.
<br /> <br />
```
make prune
```
Prune all docker containers on the host machine.
<br /> <br />
```
make re
```
Stops, cleans and restart the infrastructure.
