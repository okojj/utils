#!/bin/bash

GIT_DEV_NM="dev-ojj"
GIT_MAIN_NM="main"

FROM=$1
TO=$2

if [[ "$FROM" == "" ]] || [[ "$TO" == "" ]] ; then
	echo "Usage: $(basename $0) from_branch to_branch"
	echo "ex) $(basename $0) dev-ojj main"
	exit
fi


git checkout $FROM; git pull; git checkout $TO; git merge $FROM; git push; git checkout $FROM

