FROM ubuntu:zesty

RUN set -x && \
    apt-get update && \
    apt-get install -y php curl autoconf automake build-essential libxml2-dev libssl-dev openssl libbz2-dev libmcrypt-dev libreadline-dev && \
    apt-get install -y postgresql-server-dev-all libxslt1-dev && \
    curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
    chmod +x phpbrew && \
    mv phpbrew /usr/local/bin/phpbrew && \
    phpbrew init && \
    echo 'source ~/.phpbrew/bashrc' >> ~/.bashrc && \
    source ~/.bashrc && \
    phpbrew self-update && \
    phpbrew update && \
    phpbrew known --update && \
    phpbrew known --old

