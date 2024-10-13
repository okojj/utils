#!/bin/bash

CHECK_FILE="/var/lib/update-notifier/updates-available"

#cat $CHECK_FILE

update_count=$(cat $CHECK_FILE | grep "updates can be applied" | awk '{print $1}')

if [[ $update_count -gt 0 ]]; then
#    echo "$update_count"
    cat $CHECK_FILE
    exit "$update_count"    # for jenkins
fi
