#!/bin/bash

set -eoux pipefail

BUILDNAME="${1:-/tmp/newbuild.zip}"

TRAX_HOME="/home/trax"
CONSOLE_HOME="${TRAX_HOME}/console"
BACKUP_HOME="${TRAX_HOME}/backups"
LATEST="${BACKUP_HOME}/latest-backup.tgz"

# strips out all that toplevel crap from the trax console zip
#
unzip-strip() (
    local zip=$1
    local dest=${2:-.}
    local temp=$(mktemp -d) && unzip -d "$temp" "$zip" && mkdir -p "$dest" &&
    shopt -s dotglob && local f=("$temp"/*) &&
    if (( ${#f[@]} == 1 )) && [[ -d "${f[0]}" ]] ; then
        mv "$temp"/*/* "$dest"
    else
        mv "$temp"/* "$dest"
    fi && rmdir "$temp"/* "$temp"
)


#
# Check that the build exists before committing to the rest
#
if [ ! -f "$BUILDNAME" ];then
	echo "BUILD [ $BUILDNAME ] not found to restore."
	exit 2
fi
	
	
#
#
# Backup the current configuration
#
${TRAX_HOME}/scripts/backup-current-config.sh


#
# Clear out the current trax console build
#
rm -rf ${CONSOLE_HOME}/*


#
# unzip the latest build for trax console
#
cd $CONSOLE_HOME; unzip-strip "$BUILDNAME" .

#
# get the version, and create the Eula file
# 
VERSION="`cat ${CONSOLE_HOME}/TRAX.Console.deps.json  | grep -i TRAX.Console/ | head -1 | sed -e 's/.*\/ *\([0-9].*\)\".*/\1/'`"
touch ${CONSOLE_HOME}/Eula/$VERSION-ConsoleTraxEula

#
# restore the latest backup of the configuration files
#
[[ -e ${TRAX_HOME}/backups/latest-backup.tgz ]] && ${TRAX_HOME}/scripts/restore-latest-config.sh


