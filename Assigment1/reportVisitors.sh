#!/bin/bash

## Get the list of users in visitor group
visitorGroup=`cat /etc/group | grep visitor`

## Remove the Group details but splitting by ':' delim and extract users
users=`echo $visitorGroup | cut -d ':' -f 4`

## Dump results into visitors.txt
IFS=',' read -ra user <<< $users
printf '%s\n' "$user[@]" > /tmp/visitors.txt
