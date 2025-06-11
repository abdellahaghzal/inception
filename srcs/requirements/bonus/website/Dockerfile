FROM debian:11

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY files/ /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
