#!/bin/bash

filename='Usernames.txt'

## Create group visitors and staff
logger Creating new group visitor
sudo addgroup visitor
logger Creating new group staff
sudo addgroup staff

## Remove any carriage return in file
sed 's/\r$//' $filename > tmp.txt

logger Parsing Usernames.txt to create Users
## Create User with password same as username, home directory and group
while IFS="," read -r username group; do
    logger Creating User $username and adding to Group $group
    sudo useradd $username -m -s /bin/bash -G $group
    echo "$username:$username" | sudo chpasswd
done < 'tmp.txt'
unset IFS

logger User Creation Completed

## Delete tmp file that was created earlier
rm tmp.txt