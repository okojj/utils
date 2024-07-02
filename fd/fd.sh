#!/bin/bash

RUN_LOCAL_CMD="./run.sh local"
REPO_POSTFIX=".flydoctor.kr"

if [ "$#" != 2 ]; then
	echo "Usage: $(basename $0) site (hospital|pharm|seller|admin|partner)"
	echo "$(basename $0) seller"
	echo $#
	exit;
fi
CMD=$1
SITE=$2

REPO_DIR="${SITE}${REPO_POSTFIX}"
REPO_FULL_PATH="/Users/ojj/repo.fd/$REPO_DIR"

cd $REPO_FULL_PATH
if [ "$CMD" == "run" ]; then
	$RUN_LOCAL_CMD
fi
