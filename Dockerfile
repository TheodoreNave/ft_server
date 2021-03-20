FROM debian:buster

#=================================================APT-GET INSTALL STUFF========================================#

RUN 			apt-get update \
				&& apt-get install vim -y \
				&& apt-get install nginx -y \
				&& apt-get install wget -y \
				&& apt-get install mariadb-server mariadb-client -y \
				&& apt-get install openssl -y \
				&& apt-get install php7.3 php-mysql php-fpm php-cli php-mbstring php-xml -y

#=================================================WORDPRESS====================================================#

RUN 			wget https://wordpress.org/latest.tar.gz \
				&& wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz

RUN 			tar -xf latest.tar.gz \
				&& rm -rf latest.tar.gz \
				&& mv wordpress ../var/www/html/

#=================================================PHP_MY_ADMIN=================================================#

RUN 			tar -xf phpMyAdmin-5.1.0-all-languages.tar.gz \
				&& rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz \
				&& mv phpMyAdmin-5.1.0-all-languages ../usr/share/phpmyadmin/ 

RUN				ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

#=================================================OTHER_SERVER_CONF_STUFF======================================#

COPY			./srcs/nginx.conf 		/etc/nginx/sites-available/localhost

COPY			./srcs/nginxoff.conf 	/tmp/

COPY			./srcs/setup_mysql.sql	/tmp/

RUN				ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

COPY 			./srcs/conf.sh 		/tmp/

COPY 			./srcs/on_off.sh 	/tmp/  
#copy in tmp ? Possibility of running on start ?

COPY			./srcs/config.inc.php 	phpmyadmin/

COPY 			./srcs/wp-config.php 	wordpress/

COPY            ./srcs/wordpress.sql 	/tmp/

#=================================================CONFIGURATION================================================#

WORKDIR			/var/www/html/

RUN 			chown -R www-data:www-data *

RUN 			chmod 755 -R *

RUN				service mysql start && mysql -u root mysql < /tmp/setup_mysql.sql \
				&& mysql wordpress -u root --password= < /tmp/wordpress.sql

RUN				openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=tnave' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

CMD				bash /tmp/conf.sh

EXPOSE 			80 443



#Finish building my website ! Learn more about docker container for stopping some containers + Notion docker update