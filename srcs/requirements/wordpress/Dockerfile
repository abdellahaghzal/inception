FROM debian:12

RUN apt-get update
RUN apt-get -y install wget \
                       php \
                       php-fpm \
                       php-mysql \
                       php-pdo \
                       php-mbstring \
                       curl \
                       less

RUN mkdir -p /run/php && sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wp.sh

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["setup_wp.sh"]
