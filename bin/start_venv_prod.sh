#! /bin/bash

set -e

if [ -z $1 ]
then
    echo “USAGE: start_venv.sh venv [workdir]”
    exit 2
fi

VENV=/var/venv/$1

if [ ! -f $VENV/etc/environment ]
then
    echo “Could not find $VENV/etc/production”
    exit 2
fi

cd $VENV
source $VENV/bin/activate
source $VENV/etc/production
django $MANAGE_COMMAND

