#!/bin/bash

SW=$1
USR=$2
PASS=$3

/usr/bin/expect <<EOD

spawn ssh -o StrictHostKeyChecking=no -o CheckHostIP=no $USR@$SW
expect "assword"
send "$PASS\r"
expect "Do you want to use the wizard for initial configuration?"
send "no\r" 

expect >
send "\x04"

EOD

