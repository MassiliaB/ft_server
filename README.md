# ft_server

42 project March 2021.

## Subject
About system administration and Docker. Set up an Nginx server with a Wordpress, PhpMyadmin and a Mysql database, running in a single container.

## The project
**What is Docker ?**

[Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications.](https://docs.docker.com/get-started/overview/).

In one word a Docker provides the possibility to package and run in an isolated environment called a container. A container is like a virtual machine but contrarily to the VM it shares its ressources with the host and is much more lighter.

![2](https://user-images.githubusercontent.com/62947287/112336036-02495500-8cbd-11eb-9cc0-68477fea4ef4.png)

**The Dockerfile**

It allows you to build your image from the instructions. It contains all the command you will need to creat your image.
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

**Some of the basics commands :**

Build your image from your Dockerfile
> docker build -t *your_image* .

Run your docker 
> docker run --name *your_image's name* -d -p 443:443 -p 80:80 *your_image*

Get in your container
> docker exec -it *you_image* bash

Stop your container
> docker stop *your_image*

Delete the container
> docker rm *your_image*

Clean every container & cache
> docker system prune

## A great tutorial

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10

