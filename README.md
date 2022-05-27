# GitCronArchive
### -a cron job to archive git repo files-

RUN `crontab -e` to edit current user cronjob in a linux host machine.

Check cron job generator at [generateit.net/cron-job](https://www.generateit.net/cron-job/)

example to run a cron job: (add the following command after executing "crontab -e")

`*/30 * * * * /home/username/job.sh > /dev/null 2>&1`

(above command runs job.sh script every 30 mins)





### First Approach: (the git-way; pushing to a specific branch)

The following script is to add, commit & push to a specific branch in remote repo:

```
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

```

### Second Approach: (archiving the git working directory)

The following script is to archive all working tree files & directories in to the local host:


```
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
```