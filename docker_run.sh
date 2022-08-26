#!/bin/bash
source .dockerenv

IMAGE="${IMAGE:-$IMAGE_NAME}"

CONTAINER_ID=$(docker inspect --format="{{.Id}}" ${IMAGE} 2> /dev/null)
if [[ "${CONTAINER_ID}" ]]; then
    docker run --shm-size=50g --rm \
        --gpus all \
	-itd \
	-p 27182:22 \
	--name ${CONTAINER_NAME} \
        --user $(id -u):$(id -g) \
        -e CUDA_DEVICE_ORDER=PCI_BUS_ID \
        -v /home/${USER}:/home/${USER} \
        -v /etc/sudoers:/etc/sudoers:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v /etc/shadow:/etc/shadow:ro \
	--workdir=/home/${USER} \
        $IMAGE /bin/bash
else
    echo "Unknown container image: ${IMAGE}"
    exit 1
fi
