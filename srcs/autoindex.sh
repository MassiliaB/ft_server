#!/bin/sh

if [ "$AUTOINDEX" = "off" ] ;
	then rm /etc/nginx/sites-available/default && mv default_off /etc/nginx/sites-available/ ;fi
