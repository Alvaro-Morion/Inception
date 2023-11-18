FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y wget

RUN apt install -y php php-fpm php-mysql mariadb-client

RUN wget https://es.wordpress.org/wordpress-6.4.1-es_ES.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.4.1-es_ES.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN echo 'clear_env = no' >> /etc/php/7.3/fpm/php.ini

RUN echo 'listen = wordpress:9000' >> /etc/php/7.3/fpm/php.ini

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN sleep 10

RUN wp config create --allow-root --dbname = $SQL_DATABASE --dbuser = $SQL_USER --dbpass = $SQL_PASSWORD --dbhost = mariadb:3306 --path='/var/www/wordpress'

RUN wp core install

RUN wp user create

RUN mkdir /run/php

RUN /usr/sbin/phm-fpm7.3 -F
