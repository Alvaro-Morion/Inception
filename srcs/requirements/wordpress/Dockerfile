FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y curl wget

RUN apt install -y php-fpm php-mysql

RUN mkdir /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-6.4.tar.gz

RUN tar -xvfz wordpress-6.4.tar.gz && rm -rf wordpress-6.4.tar.gz

RUN rm wordpress/wp-config-sample.php

COPY ./conf/wp-config.php	wordpress/

RUN chmod 777 wordpress/

RUN chown -R www.data:www.data-wprdpress

RUN mv wordpress/* .

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp.cli-par

RUN mv wp.cli-par /usr/local/bin/wp-cli

COPY ./tools/script.sh-O /usr/local/bin/script.sh

EXPOSE 9000

RUN /usr/local/bin/script.sh
