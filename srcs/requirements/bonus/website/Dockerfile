FROM debian:11

RUN apt update && apt install -y nginx openssl && apt clean

COPY files/ /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]