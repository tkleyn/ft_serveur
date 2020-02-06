# Choosing image:version
FROM debian:buster

RUN apt-get update

# Installing nginx
RUN apt-get install -y nginx

# Installing Mariadb (fork of mysql)
RUN apt-get install -y mariadb-server

# Copying wordpress
COPY srcs/wordpress /var/www/wordpress

# Copying phpmyadmin
COPY srcs/phpmyadmin /var/www/phpmyadmin

# Installing PHP tools
RUN apt-get install -y php7.3-fpm php-mysql

#
COPY srcs/nginx_conf /etc/nginx/sites-available/

#
RUN ln -s /etc/nginx/sites-available/nginx_conf /etc/nginx/sites-enabled/

#
RUN unlink /etc/nginx/sites-enabled/default


# 
CMD service mysql start && service php7.3-fpm start && nginx -g "daemon off;"
