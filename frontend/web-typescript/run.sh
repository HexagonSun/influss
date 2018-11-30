#!/bin/bash

MODULE_NAME="frontend/web-typescript"

source ${BASH_SOURCE%/*}/../../common/common.sh

print_title $MODULE_NAME

IMAGE_NAME="influss/frontend/web-typescript"
CONTAINER_NAME="influss_frontend_web-typescript"


check_env INFLUSS_SERVER_API_PORT $INFLUSS_SERVER_API_PORT
check_env INFLUSS_FRONTEND_1_PORT $INFLUSS_FRONTEND_1_PORT

docker run -i -t \
    --name $CONTAINER_NAME \
    --env "INFLUSS_SERVER_API_PORT=${INFLUSS_SERVER_API_PORT}" \
    --publish ${INFLUSS_FRONTEND_1_PORT}:80 \
    ${IMAGE_NAME}

print_exit $MODULE_NAME
