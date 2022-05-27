#!/bin/bash

## define git working directory:
$GITWORKDIR=""
## example:
## $GITWORKDIR="/home/centos/mygit/"

## make a directory to store archives
mkdir -p ~/tmp/gitlocalcronarchive

## remove previous archives
# rm -rf ~/tmp/gitlocalcronarchive/*

cd $GITWORKDIR

## archiving using the plumbing command "git ls-files"
git ls-files -cmo --directory | tar -czf gitlocalcronarchive.tgz -T -
## check "git ls-files --help" manual page for the flags & type of files or directories that need to be archived

## moving the archive to the tmp directory
mv gitlocalcronarchive.tgz ~/tmp/gitlocalcronarchive/gitlocalcronarchive_$(date +"%F-%H:%M:%S").tgz