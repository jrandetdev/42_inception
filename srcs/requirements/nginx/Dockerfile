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
RUN apt-get update && apt-get install nginx openssl -y && \
mkdir -p /etc/nginx/ssl && \
openssl req -x509  -nodes -newkey rsa:2048 -keyout \
/etc/nginx/ssl/inceptionkey.pem -sha256 \
-days 1024 -out /etc/nginx/ssl/inception.crt \
-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=vourlogin.42.fr" \
&& mkdir -p /var/www && echo "<h1>Nginx SSL is working!</h1>" > /var/www/index.html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]


#do i not need to create data/www ?

