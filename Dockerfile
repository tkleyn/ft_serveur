# Choosing image:version
FROM debian:buster

RUN apt-get update

# Copying wordpress
RUN mkdir /var/www/wordpress
COPY sources/wordpress /var/www/

# Copying phpmyadmin
RUN mkdir /var/www/phpmyadmin
COPY sources/phpmyadmin /var/www/

# Installing ngnix
RUN apt-get install -y ngnix

# Installing Mariadb (fork of mysql)
RUN apt-get install -y mariadb-server

# Installing PHP tools
RUN apt-get install -y php-fpm php-mysql



# Port to run the container
EXPOSE 80