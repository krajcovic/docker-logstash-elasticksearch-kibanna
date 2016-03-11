#!/bin/bash

container_name=logstash

# Check container exist.
container_id=$(docker ps -a -q -f name=${container_name})
echo "Container ID: " $container_id

if [ $container_id ]; then
	echo 'Stopping container' ${container_name}
	docker stop ${container_name}
	echo 'Removing container' ${container_name}
	docker rm ${container_name}
fi

#docker run -it --rm logstash logstash -e 'input { stdin { } } output { stdout { } }'
docker run -d  --restart=always --name ${container_name} -p 4560:4560 --link elasticsearch -v "$(pwd)/config/logstash":/config-dir logstash logstash -f /config-dir/logstash.conf;
