#Based image
FROM debian:buster

#Install and update packages
RUN apt-get update && apt-get install -y \
   nginx \
   mariadb-server \
   wget \
   php php-fpm php-mysql \
   php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi \
   && echo "daemon off;" >> /etc/nginx/nginx.conf 

#Configuring files
COPY srcs/* ./

ENV AUTOINDEX on

#Configure ssl
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 \
 	&& mv mkcert-v1.1.2-linux-amd64 mkcert \
	&& chmod +x mkcert \
	&& cp mkcert /usr/local/bin/ \
	&& mkcert -install && mkcert localhost

#Install and configure Wordpress
RUN tar xvf latest.tar.gz && rm -rf latest.tar.gz \
	&& mv wordpress /var/www/html/ \
	&& chown -R www-data:www-data /var/www/html/wordpress \
	&& mv wp-config.php /var/www/html/wordpress/wp-config.php \
	&& mv wordpress.conf /etc/nginx/sites-available/ \
	&& ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

#Install and configure PhpMyadmin
RUN mkdir /var/www/html/phpmyadmin \
	&& tar xvf phpMyAdmin-5.1.0-english.tar.gz && rm -rf phpMyAdmin-5.1.0-english.tar.gz \
	&& mv phpMyAdmin-5.1.0-english/* /var/www/html/phpmyadmin \
	&& chown -R www-data:www-data /var/www/html/phpmyadmin 

#Configure Nginx
RUN	mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak \
	&& mv default /etc/nginx/sites-available/

EXPOSE 80 443

CMD bash run.sh
