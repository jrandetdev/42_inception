*This project has been created as part of the 42 curriculum by jrandet*

# 42 Inception

## Description

This project sets up a small web infrastructure using Docker Compose. It runs three services, each in its own container, built from a custom Dockerfile:

- NGINX, with a self signed TLS certificate, as the only entry point to the site (port 443 only for secure Https connection)
- WordPress, running with php-fpm, connected to NGINX over the network
- MariaDB, used as the database for WordPress

Each service keeps its data in a Docker volume that is stored on the host machine, so nothing is lost when the containers are stopped or the machine is restarted. All three containers talk to each other through a dedicated Docker network called inception network. They all contain an entry point file which is a shell script executed upon the dedicated service's startup.

## Instructions

To build and start the project, run:

    make up

This will:
- generate the password files needed by the containers (secrets)
- create the data folder on the host 
- add the project domain to /etc/hosts
- build the three Docker images (mariadb, wordpress, nginx) and start the containers

Once it is running, open https://jrandet.42.fr (don't forget the s) in a browser. The certificate is self signed, so the browser will show a warning. This is expected, you can continue past it by clicking 'authorize'.

For more detailed usage instructions, see USER_DOC.md.
For setup and development details, see DEV_DOC.md.

## Resources

Documentation and tools used while building this project:

- the official 42 Inception subject
- I completed the getting started from docker to familiarise myself (highly recommend). https://docs.docker.com/get-started/introduction/
- Docker file, compose, volumes and network documentation to understand how all these work
	Docker file:
	- https://docs.docker.com/reference/dockerfile/ 
	Docker compose:
	- https://docs.docker.com/reference/compose-file/services/
	- https://docs.docker.com/engine/network/
	- https://docs.docker.com/reference/compose-file/volumes/ 
- WordPress CLI (wp-cli) documentation 
	- https://www.hostinger.com/tutorials/how-to-install-wordpress-with-nginx-on-ubuntu/?utm_source=google&utm_medium=cpc&utm_id=20586398874&utm_campaign=Generic-Tutorials-DSA-t1%7CNT:Se%7CLang:EN%7CLO:FR&utm_term=&utm_content=750690802532&gad_source=1&gad_campaignid=20586398874&gbraid=0AAAAADMy-hYQ8fFowclwheH3MdtEMQERl&gclid=CjwKCAjw1bvTBhBbEiwAzbP8L-MKCIQgmwn5pn_LtEMnQcX3gNsaa_Oz2i9yfvJjI5SX7xYPfcA1ZBoCM2YQAvD_BwE
	- https://make.wordpress.org/cli/handbook/guides/installing/
	- https://wordpress.org/cli/
- MariaDB documentation 
	- https://mariadb.com/docs/server/mariadb-quickstart-guides/installing-mariadb-server-guide
	- https://developer.wordpress.org/advanced-administration/before-install/creating-database/
	- https://github.com/MariaDB/mariadb-docker
	- https://mariadb.com/docs/server/security/encryption/data-in-transit-encryption/certificate-creation-with-openssl
- NGINX documentation
- OpenSSL documentation, for understanding certificates and the TLS handshake
	- https://stackoverflow.com/questions/10175812/how-can-i-generate-a-self-signed-ssl-certificate-using-openssl
	- https://docs.openssl.org/3.2/man7/ossl-guide-introduction/#providers
	- https://www.cs.toronto.edu/~arnold/427/19s/427_19S/tool/ssl/notes.pdf 

AI assistance:

Claude (an AI assistant by Anthropic) was used during this project to help debug Docker Compose configuration issues, explain SSL/TLS concepts, and write this documentation. I wrote all the dockerfiles, compose, and scripts by hand and use ai more as a way to deepen my understanding. I also used it for simple tasks like checking that my domain name was coherent everywhere.
