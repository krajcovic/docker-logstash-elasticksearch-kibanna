#!/bin/bash

#docker run -d elasticsearch elasticsearch -Des.node.name="TestNode"

container_name=elasticsearch

# Check container exist.
container_id=$(docker ps -a -q -f name=${container_name})
echo "Container ID: " $container_id

if [ $container_id ]; then
	echo 'Stopping container' ${container_name}
	docker stop ${container_name}
	echo 'Removing container' ${container_name}
	docker rm $container_name
fi

docker run -d --restart=always --name ${container_name} -v "$(pwd)/config/elasticsearch/":/usr/share/elasticsearch/config elasticsearch
# docker run -it --name ${container_name} -v "$(pwd)/config/elasticsearch/":/usr/share/elasticsearch/config elasticsearch
# docker logs elasticsearch
