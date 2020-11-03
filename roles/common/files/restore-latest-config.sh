#!/bin/bash
set -eoux pipefail

TRAX_HOME="/home/trax"
CONSOLE_HOME="${TRAX_HOME}/console"
BACKUP_HOME="${TRAX_HOME}/backups"

LATEST="${BACKUP_HOME}/latest-backup.tgz"

tar xvfz $LATEST --directory=$CONSOLE_HOME

