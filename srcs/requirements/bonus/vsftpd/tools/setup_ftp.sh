#!/bin/bash

FTP_PASSWORD=$(cat /run/secrets/credentials | head -n -1)

useradd -m abdellah -d /var/www/html

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec /usr/sbin/vsftpd /etc/vsftpd.conf
