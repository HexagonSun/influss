#!/bin/bash

source "${BASH_SOURCE%/*}/common_includes.sh"

function green() {
	echo -n -e "\033[92m${1}\033[0m"
}

function print_title() {
	local module_name=$1

	echo "--------------------------"
	echo -e "----- $(green ${APPLICATION_TITLE}) --- $(green ${module_name}) -----"
	echo "--------------------------"
}

function print_exit() {
	local module_name=$1

	echo
	echo "--------------------------"
	echo -e "$(green ${module_name}) finished, exiting."
	echo "--------------------------"
}

function check_env() {
	local name=$1
	local value=$2

	if [ -z "$value" ]; then
		echo "Missing environment variable \"${name}\", exiting."
		exit 1
	fi
}