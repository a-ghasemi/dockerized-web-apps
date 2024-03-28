#!/bin/bash

echo "Create Laravel Folder"
docker run --rm -it -v $(pwd):/app bitnami/php-fpm composer create-project laravel/laravel $1

sudo chown -R ${USER}: $1
cd $1

#-----------------------------------[Primitives]

echo "Making artisan command"
echo "#!/bin/bash" > artisan.sh
echo "docker run --rm -it -v \$(pwd):/app bitnami/php-fpm php artisan \$@" >> artisan.sh
chmod +x artisan.sh


echo "Making composer command"
echo "#!/bin/bash" > composer.sh
echo "docker run --rm -it -v \$(pwd):/app bitnami/php-fpm composer \$@" >> composer.sh
chmod +x composer.sh

echo "Making sail command"
echo "#!/bin/bash" > sail.sh
echo "./vendor/bin/sail \$@" >> sail.sh
chmod +x sail.sh

echo "Making pest command"
echo "#!/bin/bash" > pest.sh
echo "./sail.sh pest \$@" >> pest.sh
chmod +x pest.sh

#------------------------------------------[Sail]

git init
git add .
git commit -m "init commit"

echo "Add Sail to the dev requirements"
./composer.sh require laravel/sail --dev

echo "Initializing Sail configs"
./artisan.sh sail:install 

sudo chown -R ${USER}: .

git add .
git commit -m "install sail"

echo "Activating Sail containers"
./sail.sh up -d

#-----------------------------------------[Breeze]

echo "Add Breeze to the dev requirements"
./composer.sh require laravel/breeze --dev
./artisan.sh breeze:install api --pest

sudo chown -R ${USER}: .

git add .
git commit -m "install breeze"

#-----------------------------------------[Pest]

echo "Add Pest to the dev requirements"
./sail.sh composer require pestphp/pest --dev --with-all-dependencies

./pest.sh --init

git add .
git commit -m "install pest"

sudo chown -R ${USER}: .

./pest.sh 
