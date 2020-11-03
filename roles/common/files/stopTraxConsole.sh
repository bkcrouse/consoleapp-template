#!/bin/bash
set -oux pipefail

CONTAINER_NAME="${1:-traxconsole}"
UP="$(podman container list -a --filter name=$CONTAINER_NAME --format {{.Status}} | grep -i up | wc -l)"

# create the container if it does not already exist in a start or stopped state
if [ $UP -eq 1 ];then
	podman stop $CONTAINER_NAME
	exit $?
fi
