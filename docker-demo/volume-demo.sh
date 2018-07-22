#!/bin/bash

# USING A VOLUME

# List the current containers
docker volume ls
# Make a volume
docker volume create myvol
# Make some example data
echo 'Hello from a volume' > /tmp/file.txt
# Attach to a container
docker run --tty --detach --mount source=myvol,destination=/data --name voltest busybox
# Copy our data in
docker cp /tmp/file.txt voltest:/data
# Execute a command in the container to verify that data
docker exec voltest cat /data/file.txt

# Clean up
docker container kill voltest
docker container rm voltest
docker volume rm myvol
