#!/usr/bin/env sh
#
# Script to make files written to docker's mounted folder to have the same owner as the folder,
# thus avoiding everything being owned by root.
#
# For Alpine
#
# Added by Cody Feng, 4 June 2018.
#

VOLUME=/data
USER=docker-user
GROUP=docker-group

if [ ! -d $VOLUME ]; then
    exit 1
fi

USERID=$(stat -c %u $VOLUME)
GROUPID=$(stat -c %g $VOLUME)

deluser $USER > /dev/null 2>&1

addgroup -g $GROUPID $GROUP > /dev/null 2>&1
adduser -u $USERID -D -g "Docker User,0,0,0" -s /bin/sh -G $GROUP $USER > /dev/null 2>&1
# Get user by ID in case user with the same ID already exists
USER=$(getent passwd "$USERID" | cut -d: -f1)

sudo --user=$USER $@
