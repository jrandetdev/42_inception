#create an image from bookworm which is the most stable version
FROM debian:bookworm

#apt-get installs packages,m and a single call to apt gtet updater causes casshing issues
RUN apt-get update && apt-get install -y mariadb-server
VOLUME /var/lib/mysql
#each instrucvtion is cashed for the next time it runs. if one layer is invalidated, all thew nbext laye

#mariadb default port toi which other services can conbnect 
EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server" 
#go chedck the create tables and create user from mariadb and wordpress 


#this is the container command
CMD ["mariadbd"]
