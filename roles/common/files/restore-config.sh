#!/bin/bash
set -eou pipefail

TRAX_HOME="/home/trax"
CONSOLE_HOME="${TRAX_HOME}/console"
BACKUP_HOME="${TRAX_HOME}/backups"

LATEST="${BACKUP_HOME}/latest-backup.tgz"

echo "Please select the configuration to restore from the list"

backups=$(ls ${BACKUP_HOME}/*.tgz)
i=1
for j in $backups
do
	echo "$i.$j"
	backups[i]=$j
	i=$(( i + 1 ))
done

echo "\nEnter number of the backup configuration to restore: "
read input

echo "\nYou selected to restore the file ${backups[$input]}\n"
tar xvfz ${backups[$input]} --directory=$CONSOLE_HOME

