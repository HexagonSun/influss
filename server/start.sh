#!/bin/bash

MODULE_NAME="server"

source ${BASH_SOURCE%/*}/../common/common.sh

print_title $MODULE_NAME


CONTAINER_NAME="influss_server"


docker start -a $CONTAINER_NAME


print_exit $MODULE_NAME
