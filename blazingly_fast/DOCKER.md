# Blazingly Fast Docker Commands

## Global & System

- `docker version` shows the current Docker version and info.
- `docker info` displays system-wide information.
- `docker system df` shows docker disk usage.
- `docker system prune -a` removes all unused containers, networks, images, and volumes (use with caution).

## Images

- `docker images` or `docker image ls` lists all local images.
- `docker pull [image]:[tag]` downloads an image from a registry (e.g., `docker pull postgres:15`).
- `docker build -t [name]:[tag] .` builds an image from the Dockerfile in the current directory and tags it.
- `docker rmi [image_id]` removes a specific image.
- `docker image prune` removes unused/dangling images.

## Containers: Lifecycle

- `docker ps` lists all running containers.
- `docker ps -a` lists all containers (running and stopped).
- `docker run [image]` creates and starts a new container.
- `docker run -d [image]` runs the container in the background (detached mode).
- `docker run -p [host_port]:[container_port] [image]` maps a port from the host to the container.
- `docker run --name [custom_name] [image]` assigns a custom name to the container.
- `docker run -v [host_path]:[container_path] [image]` mounts a volume from the host to the container.
- `docker start [container]` starts a stopped container.
- `docker stop [container]` gracefully stops a running container.
- `docker kill [container]` forces a running container to stop immediately.
- `docker restart [container]` stops and then starts a container.
- `docker rm [container]` removes a stopped container (`-f` forces removal of a running one).

## Containers: Interaction & Debugging

- `docker logs [container]` fetches the logs of a container.
- `docker logs -f [container]` follows the log output in real-time.
- `docker exec -it [container] /bin/sh` opens an interactive shell inside a running container (use `/bin/bash` if available).
- `docker top [container]` displays the running processes inside a container.
- `docker inspect [container]` shows low-level information (JSON format) about a container.

## Networks

- `docker network ls` lists all available networks.
- `docker network create [name]` creates a new custom network.
- `docker network connect [network] [container]` connects a container to a network.
- `docker network disconnect [network] [container]` disconnects a container from a network.
- `docker network inspect [network]` shows detailed information about a network.

## Volumes

- `docker volume ls` lists all local volumes.
- `docker volume create [name]` creates a new volume.
- `docker volume inspect [name]` shows details about a volume.
- `docker volume rm [name]` removes a specific volume.

## Docker Compose

- `docker compose up` builds, (re)creates, starts, and attaches to containers for a service.
- `docker compose up -d` starts the containers in the background (detached).
- `docker compose up --build` forces a rebuild of the images before starting.
- `docker compose down` stops and removes containers, networks, images, and volumes created by `up`.
- `docker compose down -v` removes named volumes declared in the `volumes` section as well.
- `docker compose logs -f` follows the log output for all services.
- `docker compose ps` lists containers running as part of the compose file.
- `docker compose exec [service_name] /bin/sh` executes a command (like opening a shell) in a specific service.
