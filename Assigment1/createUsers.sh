# /bin/bash

## Create group visitors and staff
sudo addgroup visitors
sudo addgroup staff

## Create User with password same as username, home directory and group
sudo useradd -m -g $groupname $username

