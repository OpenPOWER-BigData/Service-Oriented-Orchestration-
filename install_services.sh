#!/bin/bash
input=$1
# Set "," as the field separator using $IFS 
# and read line by line using while read combo 

install(){
 pre_install

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
  install $f1 $f2 $f3
done < "$input"

