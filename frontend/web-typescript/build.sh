#!/bin/bash

MODULE_NAME="frontend/web-typescript"

source ${BASH_SOURCE%/*}/../../common/common.sh

print_title $MODULE_NAME


IMAGE_NAME="influss/frontend/web-typescript"


docker build -t ${IMAGE_NAME} .


print_exit $MODULE_NAME
