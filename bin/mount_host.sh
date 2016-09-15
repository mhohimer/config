#!/bin/bash
#remote_host=mh-en-7m77s
# skip relying on some windows smb dns server
remote_host=192.168.8.1
remote_path=proj
remote_user=mhohimer
local_path=~/proj

mkdir -p $local_path
chmod 750 $local_path

# see man mount.cifs for more
# vers=2.1 is for windows7 smb

sudo mount -t cifs //$remote_host/$remote_path $local_path \
    -o username=$remote_user,uid=$(id -u),gid=$(id -g),file_mode=0750,dir_mode=0750,forceuid,forcegid,vers=2.1
