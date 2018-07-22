# Intro To Containers And Kubernetes (command cheatsheet)

## General Basics

* `docker version`
* `minikube version`
* `git version`

## Docker Basics

* `docker container ls`
* `docker images`

## Docker run basics

* `docker run -d -p 8080:80 nginx:latest`
* `docker container ps`
* `docker container attach $name`
* `docker container logs $name`
* `docker container exec -it $name /bin/bash --`
* `docker container run python:2` (what happened?!?)
* `docker container ls` (nothing...gasp!)
* `docker run -it python:2`

## Docker image basics

* `docker image ls`
* `docker image history`

# Docker local registry basics

* `docker container run -d -p 5000:5000 --name registry registry:2`
* `docker image ls`
* `docker image push $repoNoTag`
* `docker image push $repoWithTag`
* `docker image pull $repoWithTag`

# Docker build basics

* `docker image build -t repo/name:tag .` (last command arg is path to Dockerfile)
* `docker image rm repo/name:tag`
* `docker container run -d -p 9000:9000 repo/name:tag`
* `docker container ls`
* `docker container stop $name`

# Docker volume basics
* `docker volume create $name`
* `docker volume ls`
* `docker volume rm $name`
* `docker run -d --name $myContainer --mount source=$name,target=$pathInContainer name:tag`
* `docker run -d --name $myContainer --mount source=$name,target=$pathInContainer,readonly name:tag`
* `docker run -d -v $name:$pathInContainer name:tag`
