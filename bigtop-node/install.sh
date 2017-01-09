#!/bin/bash
set -ex

apt-get update -y
apt-get install -y python wget openssl liblzo2-2 openjdk-8-jdk unzip netcat-openbsd apt-utils openssh-server libsnappy1v5 libsnappy-java ntp cpufrequtils
service ntp start
ufw disable
