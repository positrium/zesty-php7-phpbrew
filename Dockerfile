# docker build -t imasami/zesty-php7-phpbrew:7.1.6 .

FROM imasami/zesty-php7-phpbrew:latest

RUN set -x && \
    phpbrew install php-7.1.6 +default +pdo +mysql +pgsql && \
    source ~/.phpbrew/bashrc && \
    phpbrew switch 7.1.6 && \
    php -v

