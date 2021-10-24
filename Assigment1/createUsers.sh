#!/bin/bash
## Create group visitors and staff
logger Creating new group visitor
echo "sudo addgroup visitor"
logger Creating new group staff
echo "sudo addgroup staff"

logger Parsing Usernames.txt to create Users
## Create User with password same as username, home directory and group
while IFS="," read -r username group; do
    logger Creating User $username and adding to Group $group
    echo "sudo useradd $username -m -s /bin/bash -G $group"
    echo "$username:$username | sudo chpasswd"
done < 'Usernames.txt'
unset IFS

logger User Creation Completed