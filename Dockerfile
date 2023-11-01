FROM jwigley/alpine-node-git-yarn:node-18

RUN apk --update --no-cache add curl ca-certificates nginx

RUN echo "UTC" > /etc/timezone

# Installing bash
RUN apk add bash

# Installing PHP
RUN apk add --no-cache php56 \
    php56-common \
    php56-fpm \
    php56-pdo \
    php56-opcache \
    php56-zip \
    php56-phar \
    php56-iconv \
    php56-cli \
    php56-curl \
    php56-openssl \
    php56-mbstring \
    php56-tokenizer \
    php56-fileinfo \
    php56-json \
    php56-xml \
    php56-xmlwriter \
    php56-simplexml \
    php56-dom \
    php56-pdo_mysql \
    php56-pdo_sqlite \
    php56-tokenizer \
    php56-pecl-redis

# Installing composer
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
