FROM	debian:buster

RUN	apt update && apt upgrade -y

RUN	apt install -y nginx && apt install -y openssl

RUN	mkdir /etc/nginx/ssl

RUN 	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       		-out /etc/nginx/ssl/vbachele.crt \
       		-keyout /etc/nginx/ssl/vbachele.key \
       		-subj "/C=ES/ST=Madrid/L=Madrid/O=42 School/OU=amorion-/CN=amorion-/"
COPY	./config/nginx.conf /etc/nginx/conf.d

RUN	mkdir -p /run/nginx

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
