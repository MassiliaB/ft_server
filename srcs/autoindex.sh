#!/bin/sh

if [ "$AUTOINDEX" = "off" ] ;then 
	sed -i "s/autoindex on/autoindex off/g" /etc/nginx/sites-enabled/default ;
fi
service nginx reload
