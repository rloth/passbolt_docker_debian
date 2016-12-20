# PASSBOLT DEBIAN DOCKER CONTAINER

ATTENTION : THIS IS A DEMO CONTAINER. DO NOT USE IT IN PRODUCTION.

How to use it
-------------
1) Check the container configuration.
There is a configuration file located in `.env`

It contains the following options :

- PASSBOLT_DIR : /var/www/passbolt (will be the path of the passbolt api source code inside the container)
- MYSQL_HOST : mysql host. Keep it as 'localhost' to let the container handle the database.
- MYSQL_ROOT_PASSWORD : root password of mysql. It is only useful if MYSQL_HOST is set to localhost.
- MYSQL_USERNAME : valid username for the database.
- MYSQL_PASSWORD : valid password for the database.
- MYSQL_DATABASE : name of the database to be used.
- ADMIN_USERNAME : email of the admin user.
- ADMIN_FIRST_NAME : first name of the admin user.
- ADMIN_LAST_NAME : last name of the admin user.

**Usually you can just keep the default values.**

2) Generate the gpg server key.
```
	./bin/generate_gpg_server_key.sh
```

<!-- 3) (optional) Configure the smtp server.

In the PASSBOLT_DIR, edit the file app/Config/email.php. (NB can't edit like this because now the source of PASSBOLT_DIR is only in the container, TODO do it in entry-point.sh)

If you don't configure a smtp server, emails notifications won't be sent. User won't be able to finalize their registration. -->

3) You can build and run the container.
```
	docker build -t passbolt_image image/
```
If a smtp server has been configured you will receive a registration email at the email you defined in the .env file.

If no smtp server has been configured, you can still finalize the registration process. Take a look at the end of the docker logs,
you will find the admin user registration link.
```
docker logs passbolt | awk '/The user has been registered with success/{print $0}'
```

Behavior
--------
By default the container will create a new database and use it to install passbolt.
The database is used from within the container, but appears in the `data/` directory.
However, in case an external database is provided in the settings, it will try to use it.
A few consideration :
- There should be a valid username, password and database on the mysql server.
- If the database exists but without passbolt installed, then passbolt will be installed normally.
- If the database exists and already has a passbolt installed, then no db installation will be done and the existing data will be kept.
