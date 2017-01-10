#!/bin/bash
input=$1
# Set "," as the field separator using $IFS 
# and read line by line using while read combo 

read -s -p "Enter solution user's Password: " bd_passwd

prep_node(){
ssh $1 "bash -s" < bigtop-node/install.sh $bd_passwd
}

install(){
 server=$3@$2
 service_name=$1
 prep_node server 
 ssh $1 "bash -s" < $service_name/install.sh $bd_passwd
 ssh $1 "bash -s" < $service_name/start.sh $bd_passwd
}

while IFS=',' read -r f1 f2 f3 f4 f5 f6 f7
do 
  ## Ignore lines start with "#"
  case $f1 in
        \#*) continue;;
  esac
  echo "Service Name="$f1
  echo "  Service Location="$f2
  echo "  Service User Name="$f3
  echo "  Service Options="$f4
  install $f1 $f2 $f3 $f4
done < "$input"

