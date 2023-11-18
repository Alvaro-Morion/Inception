FROM	debian:buster

RUN		apt update -y && apt upgrade -y

RUN		apt install -y mariadb-server

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/dbcreator.sh /user/local/bin/dbcreator.sh

RUN 	chmod +x /user/local/bin/dbcreator.sh

RUN		/user/local/bin/dbcreator.sh
