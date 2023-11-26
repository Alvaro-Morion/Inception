service mysql start

mysql --user=root --password=$SQL_ROOT_PASSWORD << EOF
	create database if not exists '$SQL_DATABASE';
	create user if not exists '$SQL_USER' identified by '$SQL_PASSWORD';
	grant all privileges on '$SQL_DATABASE'.* to '$SQL_USER';
	flush privileges;
	alter user 'root'@'localhost' identified by '$SQL_ROOT_PASSWORD';
	shutdown;
EOF

mysqld_safe

