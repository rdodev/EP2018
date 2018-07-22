#!/bin/bash

# import demo
. ../demo-magic.sh -c
# USING A VOLUME

# List the current containers
pe 'docker volume ls'
# Make a volume
pe 'docker volume create myvol'
# Make some example data
pe "echo 'Hello from a volume' > /tmp/file.txt"
# Attach to a container
pe 'docker run --tty --detach --mount source=myvol,destination=/data --name voltest busybox'
# Copy our data in
pe 'docker cp /tmp/file.txt voltest:/data'
# Execute a command in the container to verify that data
pe 'docker exec voltest cat /data/file.txt'

# Clean up
docker container kill voltest
docker container rm voltest
docker volume rm myvol
