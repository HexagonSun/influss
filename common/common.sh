#!/bin/bash

source "${BASH_SOURCE%/*}/common_includes.sh"

function green() {
	echo -n -e "\033[92m${1}\033[0m"
}

function print_title() {
	local module_name=$1

	local plain_title="----- ${APPLICATION_TITLE} --- ${module_name} -----"
	local title_len=${#plain_title}

	printf -- '-%.0s' $(seq 1 ${title_len})
	echo
	echo -e "----- $(green ${APPLICATION_TITLE}) --- $(green ${module_name}) -----"
	printf -- '-%.0s' $(seq 1 ${title_len})
	echo
}

function print_exit() {
	local module_name=$1

	local plain_title="${module_name} finished, exiting."
	local title_len=${#plain_title}

	echo
	printf -- '-%.0s' $(seq 1 ${title_len})
	echo
	echo -e "$(green ${module_name}) finished, exiting."
	printf -- '-%.0s' $(seq 1 ${title_len})
	echo
}

function check_env() {
	local name=$1
	local value=$2

	if [ -z "$value" ]; then
		echo "Missing environment variable \"${name}\", exiting."
		exit 1
	fi
}