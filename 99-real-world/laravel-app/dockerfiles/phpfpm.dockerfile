FROM bitnami/php-fpm:latest

RUN apt update
RUN apt install -y autoconf gcc make curl php-curl

RUN pecl install -o -f redis  
RUN  rm -rf /tmp/pear 

RUN echo "extension=redis.so" >> /opt/bitnami/php/lib/php.ini
