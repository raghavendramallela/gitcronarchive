#!/bin/bash

## define git working directory:
$GITWORKDIR=""
## example:
## $GITWORKDIR="/home/centos/mygit/"

## define git branch:
$GITWORKBRANCH=""
## example:
## $GITWORKBRANCH="raghu"

cd $GITWORKDIR
git add .
git commit -m "automatic cron commit"
git push origin $GITWORKBRANCH
