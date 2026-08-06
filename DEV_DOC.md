# Developer documentation

This document explains how the project is put together and how to work on it. For day to day usage, see USER_DOC.md.

## Prerequisites

- Docker and Docker Compose installed
- make installed
- sudo rights on the machine, needed to add an entry to /etc/hosts and to create the data folder on the host in my makefile

## Project layout

- Makefile, at the root of the repository, used to build and manage the whole project
- srcs/docker-compose.yml, which defines the three services: mariadb, wordpress, nginx
- srcs/.env, which holds the environment variables used across the project, such as ports, the 42 login, and database names
- srcs/requirements/mariadb, srcs/requirements/wordpress, srcs/requirements/nginx, one folder per service, each containing:
  - a Dockerfile
  - a tools folder with the entrypoint script that runs when the container starts
  - a conf folder with configuration files copied into the image

## Setup

1. Clone the repository.
2. Open srcs/.env and check the values, in particular HOSTUSERLOGIN, which should match your own 42 login, and DATA_PATH, which should point to a folder you have permission to write to on this machine.
3. Run make up from the root of the repository.

## Makefile usage

- make, or make up: generate the secrets, create the data folder, add the domain to /etc/hosts, then build and start all the containers
- make build: build the Docker images without starting the containers
- make down: stop and remove the containers
- make stop / make start: stop or start the containers without removing them
- make restart: stop and start everything again
- make logs: follow the logs of every container
- make ps: list the containers and their status
- make clean: stop everything and remove containers, images, and volumes
- make fclean: same as clean, and also delete the local data folder. It deletes all the volumes :)
- make re: fclean followed by make, for a complete rebuild from scratch

## Docker compose commands

The Makefile targets above already point to the right files, but the underlying commands can also be run directly from inside the srcs folder:

    docker compose --env-file .env up -d --build
    docker compose ps
    docker compose logs -f <service>
    docker compose down

## Data persistence

MariaDB and WordPress each write their data into a Docker volume. These volumes are bind mounted to folders on the host machine, under the path set by DATA_PATH in srcs/.env. Because the data lives on the host and not only inside the container, the database and the WordPress files are kept even after a container is stopped, rebuilt, or the machine is restarted.

To remove this data on purpose, for example to start completely fresh, use make fclean or make re.
