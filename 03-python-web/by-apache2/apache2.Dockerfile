FROM httpd:2.4.54-bullseye

RUN apt update
RUN apt install -y vim
RUN alias ll="ls -la --color=auto"

RUN apt install -y aptitude
RUN aptitude    update
RUN aptitude -y upgrade

RUN aptitude install -y build-essential
RUN apt install -y apache2 libxml2-dev

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod rewrite
RUN a2enmod deflate
RUN a2enmod headers
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod ssl

RUN service apache2 restart