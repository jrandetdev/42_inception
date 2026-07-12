#specifies the base images for the container, we take the latest from debian
FROM debian:bookworm

#container shell, will install the specific packkages needed for the container
#-y is to say yes during the installation process
RUN apt-get update && apt-get install nginx -y

COPY ./nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
