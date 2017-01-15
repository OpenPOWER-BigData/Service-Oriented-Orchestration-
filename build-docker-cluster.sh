docker ps -aq | xargs docker rm -f
docker run -d --privileged -v `pwd`:/bigtop --name master -h master ynwa/ubuntu_dev:16.04 bash -l -c "./bigtop/docker_cluster_init.sh; service ssh start;  while true; do sleep 1000; done"
docker run -d --privileged -v `pwd`:/bigtop --link master ynwa/ubuntu_dev:16.04 bash -l -c "./bigtop/docker_cluster_init.sh;service ssh start;  while true; do sleep 1000; done"
docker run -d --privileged -v `pwd`:/bigtop --link master ynwa/ubuntu_dev:16.04 bash -l -c "./bigtop/docker_cluster_init.sh;service ssh start;  while true; do sleep 1000; done"
docker run -d --privileged -v `pwd`:/bigtop --link master ynwa/ubuntu_dev:16.04 bash -l -c "./bigtop/docker_cluster_init.sh;service ssh start;  while true; do sleep 1000; done"

