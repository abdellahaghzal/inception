FROM debian:12

RUN apt-get update && \
    apt-get install -y php php-mysql wget

COPY ./tools/adminer.sh /tmp/adminer.sh
RUN chmod +x /tmp/adminer.sh

WORKDIR /var/www/html/

EXPOSE 9090

CMD ["sh", "/tmp/adminer.sh"]
