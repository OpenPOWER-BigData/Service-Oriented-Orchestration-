#!/bin/bash

BD_USER=$1
BD_PASSWD=$2
#SUDO="echo $BD_PASSWD | $SUDO -S"
SUDO= 
$SUDO  service hadoop-yarn-resourcemanager  restart
$SUDO  service hadoop-mapreduce-historyserver restart