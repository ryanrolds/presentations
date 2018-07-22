class: middle, center

<img src="images/docker.png"/>

---

class: middle

# About me

* Lead Software Engineer
* ryanrolds@gmail.com
* https://github.com/ryanrolds

---

class: middle, center

# Questions? Comments?

Raise your hand. 

Slide: https://github.com/ryanrolds/docker_presentation
Code: https://github.com/ryanrolds/docker_pres_frontend

---

class: middle

# Overview

* Pain points
* Containers
* Docker
* Docker Compose

---

class: middle

# Pain Points

* Keeping local env up-to-date
  * Time
  * Skillset
* Syncronizing releases
* On-boarding

---

class: middle

# Micro vs Monolithic

* Docker helps with both
* Microservices benefit more

---

class: middle

# Setup & Maint.

* Updating databases is annoying
* Not everyone is a sys admin
* Shared enviornments require more syncronization

---

class: middle

# Containers vs. VMs

* Are Virtual Machines deprecated?
* Do you need the extra OS boundary?


---

class: middle

# Virtual Machines

* Better security options
* LXD is pretty nice

---

class: middle

# Containers

* Many implementations
* Great when you're not the hardware owner
* Can smooth out shipping code to the cloud

---

class: middle

# Docker Containers

* Very popular container solution
* All containers on a host share network/storage

---

class: middle

# Installing

* Runs on Linux, Windows 10, and MacOS X
* Windows and MacOS use a VM to run Docker Engine
* Windows Bash requires additional steps

---

class: middle

# Our repo

* Node.js App
* Responds to all requests with a view counter

---

class: middle

# Directory

```
$ ls -l
-rw-rw-rw- 1 ryan ryan   120 Jun 30 17:21 Dockerfile
-rw-rw-rw- 1 ryan ryan   496 Jun 30 18:57 index.js
-rw-rw-rw- 1 ryan ryan   252 Jun 30 16:35 package.json
-rw-rw-rw- 1 ryan ryan 16997 Jun 30 16:35 package-lock.json
-rw-rw-rw- 1 ryan ryan   203 Jun 30 18:56 README.md
```

---

class: middle

# Application code

```
const http = require('http');
const express = require('express');
const app = express();

app.get('/', (req, res) => res.send('Hello World!'));

const server = http.createServer(app);
server.listen(8080, () => console.log('Example app listening on port 8080!'));
```

---

# Dockerfile

```
FROM node:10
WORKDIR /app
ADD . /app
RUN npm install
EXPOSE 8080
ENV NAME docker_pres_frontend
CMD ["node", "index.js"]
```

---


# Docker Images

* Docker Hub has over 10k images
* All the popular services have containers
* It's easy to publish your own

---

# Building & Running

```
$ docker build -t frontend .
Sending build context to Docker daemon  84.99kB
Step 1/7 : FROM node:10
Step 2/7 : WORKDIR /app
Step 3/7 : ADD . /app
Step 4/7 : RUN npm install
Step 5/7 : EXPOSE 8080
Step 6/7 : ENV NAME docker_pres_frontend
Step 7/7 : CMD ["node", "index.js"]
Successfully built 2cb657bc6a41
Successfully tagged frontend:latest
```

---

# Running the image

## Foreground
```
$ docker run frontend
Example app listening on port 8080!
```

## Background
```
$ docker run -d frontend
6f45e31079108354d91b30570fed9ed451e50a17dcefe80fb3f73946ce7c240f
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
6f45e3107910        frontend            "node index.js"     2 seconds ago       Up 1 second         8080/tcp            affectionate_curran
```

---

# Ports

```
$ curl http://localhost:8080
curl: (7) Failed to connect to localhost port 8080: Connection refused
```

```
$ docker stop affectionate_curran
$ docker rm affectionate_curran

$ docker run -d -p 8080:8080 frontend
fe3b31187149deec2eef99c2c901dfcaa76fd6c106257950d0e75f45abc6bf4e

$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                    NAMES
fe3b31187149        frontend            "node index.js"     About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   angry_darwin

$ curl http://localhost:8080
Hello World!
```

---

# Logs
```
$ docker logs angry_darwin
Example app listening on port 8080!
```
## Important switches
* -f, --follow     Follow log output
* --tail string    Number of lines to show from the end of the logs (default "all")

---

# DB & Migrations
* Spin up PostgreSQL database
* Run database migrations

---

# Docker Compose

* Simplifies managing multiple container
* Makes starting/stopping local env easy

---

# docker-compose.yml
```
version: '3.3'

services:
  db:
    image: postgres:9.6
    restart: always
    ports:
      - "5432:5432"
    environment:
      POSTGRES_PASSWORD: password
      POSTGRES_USER: frontend
      POSTGRES_DB: frontend
  migrations:
    build:
      context: migrations
      dockerfile: Dockerfile
    depends_on:
      - db
    environment:
      DATABASE_URL: postgresql://frontend:password@db:5432/frontend
  frontend:
    build: .
    depends_on:
      - db
      - migrations
    ports:
      - "8000:8080"
    restart: always
    environment:
      DATABASE_URL: postgresql://frontend:password@db:5432/frontend
```

---

# DB service
```
services:
  db:
    image: postgres:9.6
    restart: always
    ports:
      - "5432:5432"
    environment:
      POSTGRES_PASSWORD: password
      POSTGRES_USER: frontend
      POSTGRES_DB: frontend
```

---

# Migrations service
```
services:
  migrations:
    build:
      context: migrations
      dockerfile: Dockerfile
    depends_on:
      - db
    environment:
      DATABASE_URL: postgresql://frontend:password@db:5432/frontend
```

---

# Frontent service
```
services:
  frontend:
    build: .
    depends_on:
      - db
      - migrations
    ports:
      - "8000:8080"
    restart: always
    environment:
      DATABASE_URL: postgresql://frontend:password@db:5432/frontend
``

---

# Starting all the services

```
$ docker-compose up --build
...
Starting docker_pres_frontend_db_1 ... done
Starting docker_pres_frontend_migrations_1 ... done
Starting docker_pres_frontend_frontend_1   ... done
Attaching to docker_pres_frontend_db_1, docker_pres_frontend_migrations_1, docker_pres_frontend_frontend_1
db_1          | LOG:  database system was shut down at 2018-07-22 23:09:53 UTC
db_1          | LOG:  MultiXact member wraparound protections are now enabled
db_1          | LOG:  database system is ready to accept connections
db_1          | LOG:  autovacuum launcher started
migrations_1  | [INFO] No migrations to run
migrations_1  | [INFO] Done
docker_pres_frontend_migrations_1 exited with code 0
frontend_1    | Example app listening on port 8080!
```

---

# Start all services in background
```
$ docker-compose up -d
Starting docker_pres_frontend_db_1 ... done
Starting docker_pres_frontend_migrations_1 ... done
Starting docker_pres_frontend_frontend_1   ... done
```

---

# Developer environments

* Private Docker image repo
* A dev enviornment repo
* Stop and remove services
* Clone microservice repo
* `docker-compose.yml` in service repo starts service in dev env network
* Implement hot reload (watcher) to rebuild and restart service container

---

class: middle

# What next?

Install Docker and dockerize your dev environment.

Lots of great information here: https://docs.docker.com/get-started/

---

# Questions

---

class: middle, center

# Thanks

<place holder for next event>

