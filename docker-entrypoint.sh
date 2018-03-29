#!/usr/bin/env sh
# Script to make files written to docker's mounted folder to have the same owner as the folder,
# thus avoiding everything being owned by root.
#
# Added by Shen Feng, 20 Sep 2017.
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

addgroup --gid $GROUPID $GROUP > /dev/null 2>&1
adduser --uid $USERID --gid $GROUPID -disabled-password --gecos "Docker User,0,0,0" -shell /bin/sh  $USER > /dev/null 2>&1

# Get user by ID in case user with the same ID already exists
USER=$(getent passwd "$USERID" | cut -d: -f1)

gosu $USER "$@"
