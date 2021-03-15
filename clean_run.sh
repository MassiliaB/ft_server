#!/bin/sh

echo "Containers that are running :"
docker ps
    
if [ "$(docker ps -q -f name=ft_server)" ]; then
	docker stop ft_server
fi

if [ "$(docker ps -aq -f status=exited -f name=ft_server)" ]; then
	docker rm ft_server
	echo "There is no container anymore :"
	 docker ps
fi

docker system prune

docker build -t ft_server .

if [ ! "$(docker ps -q -f name=ft_server)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=ft_server)" ]; then
        docker rm ft_server
    fi
	docker run --env AUTOINDEX=on --name ft_server -d -p 443:443 -p 8080:80 ft_server
#docker run --env AUTOINDEX=off ft_server -d -p 80:80 ft_server
fi
docker exec -it ft_server bash
