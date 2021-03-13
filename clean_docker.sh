echo "Containers that are running :"
docker ps
if [ ! "$(docker ps -q -f name=ft_server)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=ft_server)" ]; then
	docker rm ft_server
	echo "There is no container anymore :"
	docker ps
fi
	echo "There is no container."
fi
docker system prune
