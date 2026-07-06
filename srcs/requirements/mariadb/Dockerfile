FROM debian:bookworm as base
#create an image from bookworm which is the most stable version

#run a command to install MariaDb from the ubunut default repo
RUN apt-get update
RUN apt-get install -y mariadb-server

#mariadb default port
EXPOSE 3306
