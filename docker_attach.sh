source .dockerenv

if [ ! $(docker ps -q -f name=${CONTAINER_NAME}) ]; then
    if [ $(docker ps -aq -f status=exited -f name=${CONTAINER_NAME}) ]; then
        # cleanup
        docker rm ${CONTAINER_NAME}
    fi
    # run your container
    ./docker_run.sh
fi

docker attach ${CONTAINER_NAME}
