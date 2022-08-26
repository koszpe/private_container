# private_container

Customize Dockerfile and .dockerenv to have a private docker environment.

Build docker image with build.sh

Run docker_attach.sh which will:
- start a container if there is no running instance with the $CONTAINER_NAME specified in .dockerenv
- attach to it
