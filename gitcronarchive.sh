#!/bin/bash

## define git working directory:
$GITWORKDIR=""
## example:
## $GITWORKDIR="/home/centos/mygit/"

## make directories to store archives & untar directory
mkdir -p ~/tmp/gitlocalcronarchive ~/tmp/untargitlocalcronarchive

## remove previous archives
# rm -rf ~/tmp/gitlocalcronarchive/*.tgz 
# rm -rf ~/tmp/untargitlocalcronarchive/*

cd $GITWORKDIR

## archiving using the plumbing command "git ls-files"
git ls-files -cmo --directory | tar -czf gitlocalcronarchive.tgz -T -
## check "git ls-files --help" manual page for the flags & type of files or directories that need to be archived

## moving the archive to the tmp directory
mv gitlocalcronarchive.tgz ~/tmp/gitlocalcronarchive/gitlocalcronarchive_$(date +"%F-%H:%M:%S").tgz
