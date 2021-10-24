#!/bin/bash

## Get the list of users in visitor group
visitorGroup=`cat /etc/groups | grep visitor`

## Remove the Group details but splitting by ':' delim and extract users
users=`echo $visitorGroup | cut -d ':' -f 4`

## Replace comma delimeter with \\n so that each user is seperated by a new line
results=`echo $users | tr , \\n`

## Dump results into visitors.txt
$results > /tmp/visitors.txt