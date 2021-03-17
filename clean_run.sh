#!/bin/sh

echo "Containers that are running :"
docker ps
   
if [ "$(docker ps -q -f "name=ft_server" )" ]
then
	docker stop ft_server
	echo "Stoping the last running ft_serverer"
fi
if [ "$1" = "clean" ]
then
	docker system prune
fi

if [ "$(docker ps -aq)" ]
then
	docker rm ft_server
fi

docker build -t ft_server .

if [ "$1" = "on" ]
then
	docker run --env AUTOINDEX=on --name ft_server -d -p 443:443 -p 80:80 ft_server
else
	docker run --env AUTOINDEX=off --name ft_server -d -p 443:443 -p 80:80 ft_server
fi

docker exec -it ft_server bash

