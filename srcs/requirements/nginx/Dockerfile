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
RUN apt-get update && apt-get install nginx openssl -y

EXPOSE 443

LABEL version="1.0"
LABEL description="Nginx Server"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY "./tools/ssl_config.sh" /etc/nginx/ssl_config.sh

RUN chmod +x /etc/nginx/ssl_config.sh

ENTRYPOINT [ "/etc/nginx/ssl_config.sh" ]

CMD ["nginx", "-g", "daemon off;"]
