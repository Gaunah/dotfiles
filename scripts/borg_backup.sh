#!/bin/bash

#define colors
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m'

export BORG_PASSPHRASE=''
REMOTE=
PORT=
USER=
REPO=ssh://$USER@$REMOTE:$PORT/path/to/repo

#check for vars
if [ -z "$REMOTE" ]; then
    echo -e "${RED}remote hostname not set!$NC"; exit 1
fi

if [ -z "$USER" ]; then
    echo -e "${RED}remote user not set!$NC"; exit 1
fi

if [ -z "$PORT" ] || [ "$PORT" -le 0 ] || [ "$PORT" -gt 65535 ]; then
    echo -e "${RED}remote port out of range!$NC"; exit 1
fi

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

#check if already done today (last 24h)
if test $(find ~/.cache/last_backup -mtime -1 2>/dev/null); then
    echo -e "$BLUE[$(date +%X)] backup already done today!$NC"; exit 0
fi

#start backup
echo -e "$BLUE[$(date +%X)] start backup$NC"
borg create -p -v --stats --compression zlib \
    $REPO::'{hostname}-{user}-{now:%Y-%m-%dT%H:%M:%S}' ~ \
    --exclude-caches \
    --exclude '*/.vim' \
    --exclude '*/.cache' \
    --exclude '*/.thumbnails/'

if [ $? != 0 ]; then exit 1; fi

#start prune
echo -e "$BLUE[$(date +%X)] start prune$NC"
borg prune -v --list $REPO --prefix '{hostname}-{user}' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=1

if [ $? != 0 ]; then exit 1; fi

#set timestamp for last backup
touch ~/.cache/last_backup
echo -e "$BLUE[$(date +%X)] finished!$NC"

