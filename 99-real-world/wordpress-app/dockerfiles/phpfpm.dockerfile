FROM bitnami/php-fpm:latest

RUN apt update
RUN apt install -y autoconf gcc make curl php-curl

