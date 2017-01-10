#!/bin/bash
set -ex

pkg_dir=$PWD/pkg_bigtop
if [ ! -d $pkg_dir  ] ; then
mkdir $pkg_dir; cd $_

if [ $HOSTTYPE = "powerpc64le" ] ; then
	arch="-ppc64le"
fi
wget -O spark.zip  https://ci.bigtop.apache.org/job/Bigtop-trunk-packages/COMPONENTS=spark,OS=ubuntu-16.04$arch/lastSuccessfulBuild/artifact/*zip*/archive.zip 
unzip spark.zip; mv archive/output/spark/*.deb .; rm -rf spark; rm spark.zip
fi