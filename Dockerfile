FROM debian:buster

#=================================================APT INSTALL =================================================#

RUN 			apt-get update \
				&& apt-get install vim -y \
				&& apt-get install nginx -y \
				&& apt-get install wget -y \
				&& apt-get install mariadb-server mariadb-client -y \
			#	&& apt-get install open-ssl -y \
				&& apt-get install php7.3 php-mysql php-fpm php-cli php-mbstring -y
			#	&& apt-get install zsh -y \
			#	&& apt-get install git-all -y \
			#	&& sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y 

#=================================================WORDPRESS=================================================#

RUN 			wget https://wordpress.org/latest.tar.gz \
				&& wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz

#COPY			./srcs/nginx.conf /etc/nginx/sites-available/localhost

#RUN				ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

RUN 			tar -xvf latest.tar.gz \ 
				&& rm -rf latest.tar.gz \
				&& mv wordpress ../var/www/html/ 		

#=================================================PHP_MY_ADMIN=================================================#
RUN 			tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz \
				&& rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz \
				&& mv phpMyAdmin-5.1.0-all-languages ../usr/share/phpmyadmin/ 

RUN				ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

#=================================================OTHER_STUFF=================================================#


CMD				service nginx start && bash