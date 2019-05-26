#!/bin/bash
cd `dirname $0`/.config

kill -9 `cat scpPID.txt` && echo Synchronization has been stopped...