FROM jwigley/alpine-node-git-yarn:node-18

RUN apk --update --no-cache add curl ca-certificates nginx

RUN echo "UTC" > /etc/timezone

# Installing bash
RUN apk add bash

# Installing PHP
RUN apk add --no-cache php5 \
    php5-common \
    php5-fpm \
    php5-pdo \
    php5-opcache \
    php5-zip \
    php5-phar \
    php5-iconv \
    php5-cli \
    php5-curl \
    php5-openssl \
    php5-mbstring \
    php5-tokenizer \
    php5-fileinfo \
    php5-json \
    php5-xml \
    php5-xmlwriter \
    php5-simplexml \
    php5-dom \
    php5-pdo_mysql \
    php5-pdo_sqlite \
    php5-tokenizer \
    php5-pecl-redis

# Installing composer
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
