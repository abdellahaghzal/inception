FROM debian:11

WORKDIR /mariadb

RUN apt update
RUN apt install mariadb-server -y

COPY tools/setup_mariadb.sh .

RUN chmod +x ./setup_mariadb.sh

EXPOSE 3306

CMD ["./setup_mariadb.sh"]
