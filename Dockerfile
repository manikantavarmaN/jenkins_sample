#this is the docker file for building my-apache image
FROM  ubuntu
MAINTAINER anil anilrockstar@gmail.com
RUN  \ apt-get update && \apt-get install -y \apache2 && \
      rm /var/www/html/index.html && \
      rm -rf /var/lib/apt/lists/*
