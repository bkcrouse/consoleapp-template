#!/bin/bash
set -oux pipefail

CONTAINER_NAME="${1:-traxconsole}"
COUNT="$(podman ps -a --format {{.Names}} | grep $CONTAINER_NAME | wc -l )"

# create the container if it does not already exist in a start or stopped state
if [ $COUNT -eq 0 ];then

	 podman run -t -d --privileged --rm --net=host --name=$CONTAINER_NAME -v /opt/trax/console:/trax:z localhost/traxconsole:latest
	 exit $?
fi


#
# if the container isn't already running, start it
#
UP="$(podman container list -a --filter name=$CONTAINER_NAME --format {{.Status}} | grep -i up | wc -l)"
# start the container if not already running
if [ $UP -ne  1 ]; then
	podman start $CONTAINER_NAME
else
	echo "Container $CONTAINER_NAME is already running..."
fi
