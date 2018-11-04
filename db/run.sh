#!/bin/bash

MODULE_NAME="DB"


source ${BASH_SOURCE%/*}/../common/common.sh

print_title $MODULE_NAME


IMAGE_NAME="influss/db"
INFLUSS_DB_DATABASE="influss"

check_env INFLUSS_COMMON_DB_USER $INFLUSS_COMMON_DB_USER
check_env INFLUSS_COMMON_DB_PASSWORD $INFLUSS_COMMON_DB_PASSWORD
check_env INFLUSS_COMMON_DB_POSTGRES_USER $INFLUSS_COMMON_DB_POSTGRES_USER


docker run -i -t \
    --env "INFLUSS_DB_USER=${INFLUSS_COMMON_DB_USER}" \
    --env "INFLUSS_DB_PASSWORD=${INFLUSS_COMMON_DB_PASSWORD}" \
    --env "INFLUSS_DB_DATABASE=${INFLUSS_DB_DATABASE}" \
    --env "POSTGRES_USER=${INFLUSS_COMMON_DB_POSTGRES_USER}" \
    --publish 5432:5432 \
    --name "influss_db" \
    ${IMAGE_NAME}

print_exit $MODULE_NAME
