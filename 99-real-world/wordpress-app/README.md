# Wordpress 6.1.1 on docker

## Getting Started
there are some .env.example files that should be copied and adjusted before usage.
* `cp .env{.example,}`
* `cp configs/db.env{.example,}`

## Important notes
* database host should be `mariadb`
* the wp_root should be the main folder of the wordpress website, now there is a clean wordpress 6.1.1 that you are free to use or delete entire the folder and add your version (don't forget to delete `data` folder before executing the `docker compose up`)
* domain is `test_wp.local` and you can change it in `configs/site.conf`
* if you are using `test_wp.local` make sure you added corresponded line to `/etc/hosts`
