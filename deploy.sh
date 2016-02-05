#!/bin/bash

source=.
# target=apps@spock.ariejan.net:/home/apps/sites/coderetreat.nl
target=ariejan@mail.devroom.io:/home/ariejan/www/coderetreat.nl


git symbolic-ref HEAD | grep -q "refs/heads/master"
if [ $? != 0 ] ; then
    echo "You are not on the 'master' branch. Not deploying."
    exit 1
fi

echo "-- Uploading using rsync to ${target}"
rsync -aqz --delete-after --no-progress ${source} -e ssh ${target}
