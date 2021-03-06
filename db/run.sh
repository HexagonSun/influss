#!/bin/bash

MODULE_NAME="DB"


source ${BASH_SOURCE%/*}/../common/common.sh

print_title $MODULE_NAME


IMAGE_NAME="influss/db"
CONTAINER_NAME="influss_db"

check_env INFLUSS_DB_PORT $INFLUSS_DB_PORT
check_env INFLUSS_DB_DATABASE $INFLUSS_DB_DATABASE
check_env INFLUSS_DB_SCHEMA $INFLUSS_DB_SCHEMA
check_env INFLUSS_DB_USER $INFLUSS_DB_USER
check_env INFLUSS_DB_PASSWORD $INFLUSS_DB_PASSWORD
check_env POSTGRES_USER $POSTGRES_USER
check_env POSTGRES_DB $POSTGRES_DB

docker run -i -t \
    --env "INFLUSS_DB_DATABASE=${INFLUSS_DB_DATABASE}" \
    --env "INFLUSS_DB_SCHEMA=${INFLUSS_DB_SCHEMA}" \
    --env "INFLUSS_DB_USER=${INFLUSS_DB_USER}" \
    --env "INFLUSS_DB_PASSWORD=${INFLUSS_DB_PASSWORD}" \
    --env "POSTGRES_USER=${POSTGRES_USER}" \
    --env "POSTGRES_DB=${POSTGRES_DB}" \
    --publish ${INFLUSS_DB_PORT}:5432 \
    --name $CONTAINER_NAME \
    ${IMAGE_NAME}

print_exit $MODULE_NAME
