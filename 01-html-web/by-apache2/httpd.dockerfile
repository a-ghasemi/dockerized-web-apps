FROM httpd:2.4.54-bullseye

RUN apt update
RUN apt install -y vim
RUN alias ll="ls -la --color=auto"

RUN apt install -y apache2 libxml2-dev
