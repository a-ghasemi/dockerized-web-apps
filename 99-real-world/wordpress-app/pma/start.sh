#!/bin/bash

docker run --rm --name pmaserv -d --network wordpress-app_db_tier --link wordpress-app-mariadb-1:db -p 8080:80 phpmyadmin
