#!/bin/bash
basepath=`cat ../targetDir.txt`
interval=`cat ../syncTime.txt`
ssh=`cat ../ssh.txt`

while [ 1 = 1 ]
do	
	scp -r $basepath $ssh:~/;
	sleep $interval;
done
