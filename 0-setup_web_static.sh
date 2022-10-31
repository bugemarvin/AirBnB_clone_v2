#!/usr/bin/env bash
# installing nginx and folder and file creation
D=/data
W=/data/web_static
R=/data/web_static/releases
S=/data/web_static/shared
T=/data/web_static/releases/test
I=/data/web_static/releases/test/index.html
C=/data/web_static/current
apt-get -y update
apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
chown -R "$USER":"$USER" /var/www/
chmod -R 755 /var/www/
rm -rf /var/www/html/*
echo "Ceci n'est pas une page" >> /var/www/html/404.html
service nginx start
service nginx status
if [ -e "$D" ];
then
    echo "$D already exist"
fi
if [ -e "$W" ];
then
    echo "$W already exist"
fi
if [ -e "$R" ];
then
    echo "$R already exist"
fi
if [ -e "$S" ];
then
    echo "$S already exist"
fi
if [ -e "$T" ];
then
    echo "$T already exist"
fi
if [ -e "$I" ];
then
    echo "$I already exist"
fi
if [ -e "$C" ]
then
    rm -rf $C
else
    mkdir -p $D
    mkdir -p $W
    mkdir -p $R
    mkdir -p $S
    mkdir -p $T
    ln -s $T $C
    chown -R ubuntu:ubuntu $D
    chmod -R 755 $R
    echo "Hello World!" >> $I
    printf %s "server {
        listen 80;
        listen [::]:80 default_server;

        index index.html index.htm;

        location /hbnb_static/ {
            alias   /data/web_static/current/;
        }

        location /redirect_me {
            return 301 https://modtechy.ke/;
        }

        error_page 404 /404.html;

        location /404 {
            root /var/www/html/404.html;
            internal;
        }
}" > /etc/nginx/sites-available/default
    service nginx restart
fi
