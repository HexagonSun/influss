#!/bin/bash

MODULE_NAME="server"

source ${BASH_SOURCE%/*}/../common/common.sh

print_title $MODULE_NAME


IMAGE_NAME="influss/server"


docker build -t ${IMAGE_NAME} .


print_exit $MODULE_NAME
