#! /bin/bash

set -e

if [ -z $1 ]
then
    echo “USAGE: start_venv.sh venv [workdir]”
    exit 2
fi

VENV=$HOME/venv/$1

if [ ! -f $VENV/etc/environment ]
then
    echo “Could not find $VENV/etc/environment”
    exit 2
fi

cd $VENV
source $VENV/bin/activate
source $VENV/etc/environment
django $MANAGE_COMMAND
