FROM debian:buster

#=================================================APT INSTALL =================================================#

RUN 			apt-get update \
			#	apt-get upgrade -y \
				&& apt-get install vim -y \
				&& apt-get install nginx -y \
				&& apt-get install wget -y \
				&& apt-get install mariadb-server mariadb-client -y \
			#	&& apt-get install mysql-server \
				&& apt-get install openssl -y \
				&& apt-get install php7.3 php-mysql php-fpm php-cli php-mbstring php-xml -y
			#	&& apt-get install zsh -y \
			#	&& apt-get install git-all -y \
			#	&& sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y

#=================================================WORDPRESS=================================================#

RUN 			wget https://wordpress.org/latest.tar.gz \
				&& wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz

COPY			./srcs/nginx.conf /etc/nginx/sites-available/localhost

COPY			./srcs/nginxoff.conf /tmp/

COPY			./srcs/setup_mysql.sql	/var/



RUN				ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

RUN 			tar -xvf latest.tar.gz \ 
				&& rm -rf latest.tar.gz \
				&& mv wordpress ../var/www/html/

#=================================================PHP_MY_ADMIN=================================================#
RUN 			tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz \
				&& rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz \
				&& mv phpMyAdmin-5.1.0-all-languages ../usr/share/phpmyadmin/ 




RUN				ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

#=================================================OTHER_STUFF=================================================#

COPY 			./srcs/on_off.sh /var/www/html/

WORKDIR			/var/www/html/

COPY			./srcs/config.inc.php 	phpmyadmin
COPY 			./srcs/wp-config.php wordpress/
COPY            ./srcs/wordpress.sql /tmp/


RUN 			chown -R www-data:www-data *
RUN 			chmod 755 -R *
RUN				service mysql start && mysql -u root mysql < /var/setup_mysql.sql \
				&& mysql wordpress -u root --password= < /tmp/wordpress.sql
RUN				openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=sdunckel' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt


CMD				service nginx start && service mysql start && service php7.3-fpm start && bash /var/www/html/on_off.sh && bash

EXPOSE 			80 443


# Generate Key ssl AND Mysql
