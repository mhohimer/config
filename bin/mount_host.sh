#!/bin/bash
remote_host=mh-en-7m77s
remote_path=proj
remote_user=mhohimer
local_path=~/host_proj

mkdir -p $local_path
sudo mount -t cifs //$remote_host/$remote_path $local_path \
    -o username=$remote_user,uid=$(id -u),gid=$(id -g),forceuid,forcegid
