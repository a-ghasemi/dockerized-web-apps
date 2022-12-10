#!/bin/bash

docker run --rm --name pmaserv -d --network laravel-app_db_tier --link laravel-app-mariadb-1:db -p 8080:80 phpmyadmin
