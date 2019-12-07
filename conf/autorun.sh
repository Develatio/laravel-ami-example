#!/usr/bin/env bash

# WARNING: This script will be executed as the "admin" user.
# If you want to run it as another user, use su/sudo.

cd /var/www/webapp/src

sudo setfacl -R -d -m u:admin:rwx ./storage
sudo setfacl -R -d -m g:www-data:rwx ./storage
sudo setfacl -R -d -m o::r-x ./storage

sudo setfacl -R -m u:admin:rwx ./storage
sudo setfacl -R -m g:www-data:rwx ./storage
sudo setfacl -R -m o::r-x ./storage

# Install some dependencies
composer install
npm install

# Maybe run migrations?
# php artisan migrate --force