# docker build -t imasami/zesty-php7-phpbrew:5.4.45 .

FROM imasami/zesty-php7-phpbrew:latest

RUN set -x && \
    phpbrew install php-5.4.45 +default +pdo +mysql +pgsql && \
    phpbrew switch php-5.4.45 && \
    php -v

