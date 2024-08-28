# Use the latest Ubuntu as the base image
FROM ubuntu:latest

LABEL DEVOPSENGG="RAHUL"

RUN apt update 
RUN apt install unzip apache2 -y
RUN rm -rf /var/www/html/index.html

WORKDIR /var/www/html

COPY carvilla-v1.0 /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]

