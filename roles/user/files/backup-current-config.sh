#!/bin/bash
set -eoux pipefail

TRAX_HOME="/home/trax"
CONSOLE_HOME="${TRAX_HOME}/console"
BACKUP_HOME="${TRAX_HOME}/backups"

LATEST="${BACKUP_HOME}/latest-backup.tgz"
BACKUPFILE="${1:-${BACKUP_HOME}/$(date +%Y-%m-%d-%H%M)-latest-backup.tgz}"

TARGETS="./TRAX/NetMatrix.xml ./License ./RadioConnection/Config.xml ./Eula"

tar cvfz $BACKUPFILE --ignore-failed-read --directory=$CONSOLE_HOME $TARGETS 

COUNT="`tar tvfz $BACKUPFILE | wc -l`"

if [ $COUNT -gt 0 ]; then
	cp -f $BACKUPFILE $LATEST
else
	echo "#########################################################################"
	echo "#  No files backed up, exiting. Ensure that the build currently exists. #"
	echo "#########################################################################"
fi
