FROM debian:11

RUN apt update -y

RUN apt install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty

COPY ./tools/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/setup_ftp.sh /tmp/setup_ftp.sh

RUN chmod +x /tmp/setup_ftp.sh

EXPOSE 21

CMD ["sh", "/tmp/setup_ftp.sh"]
