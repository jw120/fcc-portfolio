#!/bin/sh

LOCAL_DIR=~/prog/jw120.github.io
echo Copying files to $LOCAL_DIR

rsync --verbose --recursive --delete --exclude=.git dist/ $LOCAL_DIR

echo Now please push to github.io
(cd $LOCAL_DIR; git status)
