FROM debian:11

RUN apt update
RUN apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup_nginix.sh /usr/local/bin/setup_nginix.sh

RUN chmod +x /usr/local/bin/setup_nginix.sh
RUN mkdir -p /var/www/html/wordpress

EXPOSE 443

CMD ["/usr/local/bin/setup_nginix.sh"]
