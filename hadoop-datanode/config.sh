#!/bin/bash
set -ex
NAMENODE=$1
RESOURCEMANAGER=$2
BD_USER=$3
change_xml_element() {
    name=$1
    value=$2
    file=$3
    sed  -i "/<name>$name<\/name>/!b;n;c<value>$value</value>" $file
} 

add_element(){
    name=$1
    value=$2
    xml_file=$3

    CONTENT="<property>\n<name>$name</name>\n<value>$value</value>\n</property>"
    C=$(echo $CONTENT | sed 's/\//\\\//g')
    sed -i -e "/<\/configuration>/ s/.*/${C}\n&/" $xml_file
}

## Add and init yarn.resourcemanager.address in yarn-site.xml
sed -i s/localhost/$NAMENODE/ /etc/hadoop/conf/core-site.xml
sed -i s/localhost/$RESOURCEMANAGER/ /etc/hadoop/conf/mapred-site.xml

add_element "yarn.resourcemanager.hostname" "$RESOURCEMANAGER" "/etc/hadoop/conf/yarn-site.xml"
add_element "yarn.resourcemanager.address" "$RESOURCEMANAGER:8032" "/etc/hadoop/conf/yarn-site.xml"
add_element "yarn.resourcemanager.resource-tracker.address" "$RESOURCEMANAGER:8031" "/etc/hadoop/conf/yarn-site.xml"
add_element "yarn.resourcemanager.scheduler.address" "$RESOURCEMANAGER:8030" "/etc/hadoop/conf/yarn-site.xml"
add_element "dfs.namenode.datanode.registration.ip-hostname-check" "false" "/etc/hadoop/conf/hdfs-site.xml"

echo "*                soft    nofile          100000" | tee -a  /etc/security/limits.conf
echo "*                hard    nofile          100000" | tee -a  /etc/security/limits.conf

	