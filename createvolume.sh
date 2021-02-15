#!/bin/sh

if test $# -ne 1 ;then
    echo "usage: ./createvolume.sh <volume name>."
    exit 1
fi

VOLNAME="$1"
ISVOL="$(docker volume ls -f name=${VOLNAME} -q)"

#create data volume for portainer
if test "$ISVOL" != "$VOLNAME" ; then
    docker volume create ${VOLNAME} >/dev/null
    echo "volume:$VOLNAME" is created.
else
    echo "volume:$VOLNAME" is existed.
fi
