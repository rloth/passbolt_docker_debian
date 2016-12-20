#!/bin/sh

# Passbolt directory.
PASSBOLT_DIR=/var/www/passbolt


# MySQL configuration.
MYSQL_HOST=localhost

# Only necessary if we use the local database.
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=passbolt
MYSQL_USERNAME=root
MYSQL_PASSWORD=$MYSQL_ROOT_PASSWORD

# Admin settings.
ADMIN_USERNAME=admin@passbolt.com
ADMIN_FIRST_NAME=Admin
ADMIN_LAST_NAME=Admin

echo "conf loaded :)"
