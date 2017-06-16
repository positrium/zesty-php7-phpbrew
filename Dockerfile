FROM ubuntu:zesty

RUN set -x && \
    apt-get update && \
    apt-get install -y php curl autoconf automake build-essential libxml2-dev libssl-dev openssl libbz2-dev libmcrypt-dev libreadline-dev && \
    apt-get install -y postgresql-server-dev-all libxslt1-dev && \
    apt-get install -y zip git
    wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --quiet && \
    mv composer.phar /usr/local/bin/composer && \
    composer -V && \
    curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
    chmod +x phpbrew && \
    mv phpbrew /usr/local/bin/phpbrew && \
    phpbrew init && \
    echo 'source ~/.phpbrew/bashrc' >> ~/.bashrc && \
    rm /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    /bin/bash -c "source ~/.bashrc" && \
    phpbrew self-update && \
    phpbrew update && \
    phpbrew known --update && \
    phpbrew known --old

