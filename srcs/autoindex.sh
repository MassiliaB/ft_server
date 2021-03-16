#!/bin/sh

if [ "$AUTOINDEX" = "off" ] ;then 
	sed -i "s/autoindex on/autoindex off/g" /etc/nginx/sites-available/default ;
elif [ "$AUTOINDEX" = "on" ] ;then
	rm var/www/html/index.css var/www/html/index.html ;
fi
service nginx reload
