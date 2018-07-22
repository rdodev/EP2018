#!/bin/bash
# USING A BIND MOUNT

mkdir /tmp/host
echo 'Hi from a bind mount' > /tmp/host/file.txt
# Run a container with the /tmp/host directory assigned to '/container' in the container.
docker run --detach -ti --name bindtest -v /tmp/host:/container busybox

# Execute a command to look at the contents within the container
docker exec bindtest cat /container/file.txt

# Look at the information Docker knows about the mounts for the container
docker inspect bindtest | jq '.[].Mounts'

# Clean up
docker kill bindtest
docker rm bindtest
rm -rf /tmp/host
