#!/bin/bash

MODULE_NAME="server"

source ${BASH_SOURCE%/*}/../common/common.sh

print_title $MODULE_NAME


IMAGE_NAME="influss/server"
CONTAINER_NAME="influss_server"

# IP given to the docker container of the DB
DB_HOST=172.17.0.2

check_env INFLUSS_DB_PORT $INFLUSS_DB_PORT
check_env INFLUSS_DB_DATABASE $INFLUSS_DB_DATABASE
check_env INFLUSS_DB_USER $INFLUSS_DB_USER
check_env INFLUSS_DB_PASSWORD $INFLUSS_DB_PASSWORD
check_env INFLUSS_SERVER_API_PORT $INFLUSS_SERVER_API_PORT

docker run -i -t \
    --env "INFLUSS_DB_HOST=${DB_HOST}" \
    --env "INFLUSS_DB_PORT=${INFLUSS_DB_PORT}" \
    --env "INFLUSS_DB_DATABASE=${INFLUSS_DB_DATABASE}" \
    --env "INFLUSS_DB_USER=${INFLUSS_DB_USER}" \
    --env "INFLUSS_DB_PASSWORD=${INFLUSS_DB_PASSWORD}" \
    --publish ${INFLUSS_SERVER_API_PORT}:5005 \
    --name $CONTAINER_NAME \
    ${IMAGE_NAME}

print_exit $MODULE_NAME