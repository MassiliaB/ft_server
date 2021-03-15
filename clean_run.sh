#!/bin/sh

echo "Containers that are running :"
docker ps
    
if [ "$(docker ps -q -f name=ft_server)" ]
then
	docker stop ft_server
	echo "Stoping the last running ft_server"
fi

if [ "$(docker ps -aq -f status=exited)" ]
then
	docker system prune
fi

docker build -t ft_server .

docker run --env AUTOINDEX=on --name ft_server -d -p 443:443 -p 8080:80 ft_server
#docker run --env AUTOINDEX=off ft_server -d -p 80:80 ft_server

docker exec -it ft_server bash
