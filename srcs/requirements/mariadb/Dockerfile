#create an image from bookworm which is the most stable version
FROM debian:bookworm

#apt-get installs packages,m and a single call to apt gtet updater causes casshing issues
RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

#mariadb stores everything in here
VOLUME /var/lib/mysql 
#the volume here is like the port it is just exposed, it needs to be added to the compose file
#each instrucvtion is cashed for the next time it runs. if one layer is invalidated, all thew nbext laye

#mariadb default port toi which other services can conbnect 
EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server" 
#go chedck the create tables and create user from mariadb and wordpress 

COPY tools/init.sh /init.sh

RUN chmod +x /init.sh

ENTRYPOINT [ "/init.sh" ]

#this is the container command
CMD ["mariadbd"]
