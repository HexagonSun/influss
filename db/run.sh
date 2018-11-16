#!/bin/bash

MODULE_NAME="DB"


source ${BASH_SOURCE%/*}/../common/common.sh

print_title $MODULE_NAME


IMAGE_NAME="influss/db"
CONTAINER_NAME="influss_db"

check_env INFLUSS_COMMON_DB_USER $INFLUSS_COMMON_DB_USER
check_env INFLUSS_COMMON_DB_PASSWORD $INFLUSS_COMMON_DB_PASSWORD
check_env INFLUSS_COMMON_DB_POSTGRES_USER $INFLUSS_COMMON_DB_POSTGRES_USER
check_env INFLUSS_COMMON_DB_SCHEMA_NAME $INFLUSS_COMMON_DB_SCHEMA_NAME
check_env INFLUSS_COMMON_DB_PORT $INFLUSS_COMMON_DB_PORT

docker run -i -t \
    --env "INFLUSS_DB_USER=${INFLUSS_COMMON_DB_USER}" \
    --env "INFLUSS_DB_PASSWORD=${INFLUSS_COMMON_DB_PASSWORD}" \
    --env "INFLUSS_DB_DATABASE=${INFLUSS_COMMON_DB_SCHEMA_NAME}" \
    --env "POSTGRES_USER=${INFLUSS_COMMON_DB_USER}" \
    --env "POSTGRES_DB=${INFLUSS_COMMON_DB_SCHEMA_NAME}" \
    --publish ${INFLUSS_COMMON_DB_PORT}:5432 \
    --name $CONTAINER_NAME \
    ${IMAGE_NAME}

print_exit $MODULE_NAME
