#!/bin/bash

#define colors
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m'

REMOTE=
PORT=
USER=
REPO=ssh://$USER@$REMOTE:$PORT/path/to/repo

#check for borg
if ! command -v borg > /dev/null; then
    echo -e "${RED}borg not installed!$NC"; exit 1
fi

#check connection
if command -v nc > /dev/null; then
    if ! nc -z -w 5 $REMOTE $PORT; then
        echo -e "${RED}could not connect to $REMOTE on port $PORT$NC"; exit 1
    fi
fi

#start backup
echo -e "$BLUE[$(date +%X)] start backup$NC"
borg create -p -v --stats --compression zlib \
    $REPO::'{hostname}-{user}-{now}' ~ \
    --exclude-caches \
    --exclude '*/.cache' \
    --exclude '*/.thumbnails/'

if [ $? != 0 ]; then exit 1; fi

#start prune
echo -e "$BLUE[$(date +%X)] start prune$NC"
borg prune -v --list $REPO --prefix '{hostname}-{user}' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=1

if [ $? != 0 ]; then exit 1; fi
echo -e "$BLUE[$(date +%X)] finished!$NC"

