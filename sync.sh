#!/bin/bash
cd `dirname $0`/.config

nohup ./scp.sh > /dev/null 2>scpError.log & echo $!>scpPID.txt	&& echo Synchronizing...