#!/bin/bash

# import demo 
. ../demo-magic.sh -c

# USING A BIND MOUNT

pe 'mkdir /tmp/host'
pe 'echo "Hi from a bind mount" > /tmp/host/file.txt'
# Run a container with the /tmp/host directory assigned to '/container' in the container.
pe 'docker run --detach -ti --name bindtest -v /tmp/host:/container busybox'

# Execute a command to look at the contents within the container
pe 'docker exec bindtest cat /container/file.txt'

# Look at the information Docker knows about the mounts for the container
pe "docker inspect bindtest | jq '.[].Mounts'"

# Clean up
pe 'docker kill bindtest'
pe 'docker rm bindtest'
rm -rf /tmp/host
