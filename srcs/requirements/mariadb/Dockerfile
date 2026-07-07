#create an image from bookworm which is the most stable version
FROM debian:bookworm
WORKDIR /app
COPY . .

#apt-get installs packages,m and a single call to apt gtet updater causes casshing issues
RUN apt-get update && apt-get install -y mariadb-server

#mariadb default port
EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server" 

#comnand that will run to chekc a copntainer is healthy, if it is zero it saucceeds, 1 failed. 
#we reed a system variable because there is no user in the databaase
#we want to check it is able to answer a simple query
HEALTHCHECK --start-period=5m CMD mariadb -e 'SELECT @@datadir;' || exit 1

#this is the container command
CMD ["mariadbd"]
