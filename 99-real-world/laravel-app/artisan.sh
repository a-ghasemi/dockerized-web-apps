#!/bin/bash

docker compose exec phpfpm php artisan $@
