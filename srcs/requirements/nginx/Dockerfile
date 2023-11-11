FROM	debian:buster

RUN		apt update && apt upgrade -y

RUN		apt install -y nginx && apt install -y openssl

RUN		mkdir /etc/nginx/ssl

RUN		openssl -req -x509 -newkey rssa:2048 -days 365 -nodes -out /etc/nginx/ssl/amorion-.crt -keyout /etc/nginx/ssl/amorion-.key

COPY	./conf/nginx.conf /etc/nginx/conf.d

RUN		mkdir -p /run/nginx

CMD		["nginx" "-g" "-daemon off;"]
