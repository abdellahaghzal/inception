#!/bin/bash

echo "Setting up TLS..."

SSL_DIR=/etc/nginx/ssl
CERT_FILE=${SSL_DIR}/server.crt
KEY_FILE=${SSL_DIR}/server.key

if [ -f "${CERT_FILE}" ] && [ -f "${KEY_FILE}" ]; then
    echo "SSL certificate already exists."
else
    mkdir -p ${SSL_DIR}


    openssl req -x509 -nodes -days 365 \
            -newkey rsa:2048 \
            -keyout ${KEY_FILE} \
            -out ${CERT_FILE} \
            -subj "/C=MA/ST=Tangier-Tétouan-Al Hoceima/L=Tétouan/O=1337/OU=IT/CN=aaghzal.42.fr"

    echo "SSL certificate generated."
fi

exec nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
