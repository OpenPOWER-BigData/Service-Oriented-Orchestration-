#!/bin/bash
#set -ex
input=$1

init_ssh() {
  user_name=$1
  ip_address=$2
  ssh $user_name@$ip_address "mkdir -p .ssh" < /dev/null
  cat ~/.ssh/id_rsa.pub | ssh $user_name@$ip_address "cat >> .ssh/authorized_keys" 
  ssh $user_name@$ip_address "chmod 700 .ssh; chmod 640 .ssh/authorized_keys" < /dev/null
}

# Set "," as the field separator using $IFS 
# and read line by line using while read combo 

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
 init_ssh root $f2
 init_ssh $f3 $f2
done < "$input"
