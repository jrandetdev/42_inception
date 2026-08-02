#specifies the base images for the container, we take the latest from debian
FROM debian:bookworm

#container shell, will install the specific packkages needed for the container
#-y is to say yes during the installation process
# x509 is a self signing request. 
# req : the certificate request taken as input
# -inceptionkey.pem specifies the private key used in signing
# keyout: file to write private key to
# sha256 is the hashing algorithm for the certificate signature
# nodes removes the encryption of the private key meaning we are not prompted for password
# subj fills it in for us
RUN apt-get update && apt-get install nginx openssl -y && rm -rf /var/lib/apt/lists/*

EXPOSE ${NGINX_PORT}

LABEL version="1.0"
LABEL description="Nginx Server"

# we keep the base of the default image, and then it includes our default.conf in http {}
#this does not break the original nginx conf
#before that we were writing over the entire config and had to manually write everything
# this avoids it and leaves part of the responsibility to nginx
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

COPY "./tools/ssl_config.sh" /usr/local/bin

RUN chmod +x /usr/local/bin/ssl_config.sh

ENTRYPOINT [ "ssl_config.sh" ]

CMD ["nginx", "-g", "daemon off;"]
