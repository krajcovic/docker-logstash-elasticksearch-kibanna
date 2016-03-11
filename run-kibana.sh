#!/bin/bash

container_name=kibana

# Check container exist.
container_id=$(docker ps -a -q -f name=${container_name})
echo "Container ID: " $container_id

if [ $container_id ]; then
	echo 'Stopping container' ${container_name}
	docker stop ${container_name}
	echo 'Removing container' ${container_name}
	docker rm $container_name
fi

docker run -d --restart=always --name ${container_name} --link elasticsearch -p 5601:5601 -d kibana
