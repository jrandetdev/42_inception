# User documentation

This document explains how to use the project once it is set up. For setup and technical details, see DEV_DOC.md.

## Starting and stopping the project

All commands below are run from the root of the repository.

- make up, or just make: build the images if needed and start everything
- make down: stop and remove the containers
- make stop: stop the containers without removing them
- make start: start containers that were stopped
- make restart: stop and start everything again
- make clean: stop everything and remove containers, images, and volumes
- make fclean: same as clean, and also deletes the local data folder
- make re: fclean followed by a full rebuild from scratch

## Accessing the website

Open this address in a browser:

    https://jrandet.42.fr

The site only works over https, on port 443. It is not available over plain http on port 80.

Because the certificate is self signed and not issued by a recognized authority, the browser will show a security warning the first time. This is expected for this project. You can continue past the warning to reach the site.

## Accessing the admin panel

Go to:

    https://jrandet.42.fr/wp-admin

Log in with the administrator account. The admin username is superuser (the login does not contain the word admin). The password is stored in the file secrets/wp_admin_password.txt.

There is also a normal WordPress user account, which can log in and add comments on the site. Its username is user, and the password is stored in secrets/wp_user_password.txt.

## Managing credentials

All passwords are generated automatically the first time make up is run, using random values. Each password is saved in its own text file inside the secrets folder:

- secrets/mariadb_root_password.txt
- secrets/mariadb_password.txt
- secrets/wp_admin_password.txt
- secrets/wp_user_password.txt

These files are not stored in git. If a password needs to change, delete the matching file and rebuild the project, and a new one will be generated.

## Basic checks

To check that everything is working:

- docker compose ps, run inside the srcs folder: shows the three containers (mariadb, wordpress, nginx) and whether they are running
- docker volume ls: shows the two data volumes (mariadb_data and wordpress_data)
- docker network ls: shows the inception-network used by the containers
- docker compose logs -f, run inside the srcs folder: follows the logs of all the containers, useful if something does not look right
