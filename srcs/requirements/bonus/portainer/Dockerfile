
FROM debian:12

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/portainer/portainer/releases/download/2.17.1/portainer-2.17.1-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xvzf portainer.tar.gz -C /usr/local/bin --strip-components=1 \
    && rm portainer.tar.gz

EXPOSE 9443

CMD [ "/usr/local/bin/portainer" ]
