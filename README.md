# 42_inception

##OpenSSL

In the nginx Dockerfile, we run an openssl commdand to generate keys. OpenSSL stands for Open Secure Socket Layer, a cryptographic communications protocol. This is to ensure HTTPS communication over a specific network. This means if a third party connects to the network, it should not be able to understand or listen to anything that parties using the network are exchanging. 

They need a symetric key to do so, a bit like with ssh. We use assymetric encryptoon. One networ user (alice) will generatea pair of kjeys on her end:
- a private key she keeps to herself
- a public key that is available to anyone who wants it.
If someone encrypts something with her private key, she can decript it with her private key. She can sign data with her private key, and her public key will be able to verify it. Bob (second user) has a similar set of keys.

If Alice wants to send a message to BOb, she can encrypt the message using bob's public key, which can be decripted with his private key. If alice wants to authenticate herself to bob, she can generate a signature by signing the message with her private key. 

CERTIFICATES

Alice can make a CSR (certificate signing request) with her public key, information that indentifies her, and sign it with her private key. These are then signed by a trusted Certificate Authority which has a private key of its own. Most browsers have a CA and users can use its self signed certificate to verify bob's certificate against the CA's certificate. 


In our case: the user (alice) is our host web browser, for example chrome hitting http://localhost. The webserver (bob) is NginX. We will hook up our nginx with an inception.key and an inception.crt, meaning we act a bit like Bob. Nginx will use our private key to decrypt incoming requests under the hood.

So in essence, we are acting as the Certificate uthority. OpenSSL will sign everything before nginx is started.

When we launch the docker compose build nginx, the Dockerfile executes the openssl -req -x509 ... command and creates two files: inception.key (private key) (secret mathematical RSA code) and inception.crt which is the public certificate containing all my info. -x509 is the self signed part. When a browser connects, our nginx will send the certificate to the browser, the browser will see it was self signed, and it will say "you are not private" because we dont use an official CA like Let's Encrypt from google.

https://www.cs.toronto.edu/~arnold/427/19s/427_19S/tool/ssl/notes.pdf
